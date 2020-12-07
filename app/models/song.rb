class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name] }
    validates :release_year, numericality: { less_than_or_equal_to: Date.current.year}, presence: true, if: :released
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
end