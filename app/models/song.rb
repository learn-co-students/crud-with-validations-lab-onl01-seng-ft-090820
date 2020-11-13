class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: :release_year }
    with_options if: :is_released? do |release|
        release.validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year}
    end

    def is_released?
        self.released == true
    end

end
