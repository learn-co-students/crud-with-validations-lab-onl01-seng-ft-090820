class Song < ApplicationRecord
    validates :title, presence: true 
    validates :artist_name, presence: true 
    validates_uniqueness_of :artist_name, scope: :release_year
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released?, numericality: { less_than: Time.now.year}
end
