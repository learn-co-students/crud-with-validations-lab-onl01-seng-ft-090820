class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :release_year}
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, if: :released?, numericality: { less_than: Time.now.year}
    validates :artist_name, uniqueness: {scope: :release_year}
end

