class Song < ApplicationRecord
    validates :title, :artist_name, :genre, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name]}
    validates :release_year, numericality: {less_than_or_equal_to: 2020, only_integer: true}, if: :released
end
