class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year }
    with_options if: :is_released? do |release|
        release.validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year}
    validates :artist_name, presence: true 
    #validates_presence_of :release_year, :if => :released?
    #validates :released, presence: true 
    end

    def is_released?
        self.released
    end
end
