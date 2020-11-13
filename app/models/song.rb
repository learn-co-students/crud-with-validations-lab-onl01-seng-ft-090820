class Song < ApplicationRecord
    validates :title, presence: true 
    validates_uniqueness_of :artist_name, scope: :release_year
    validates :released, :inclusion => {:in => [true, false]}
    # validates :released, inclusion: { in: %w(Released Unreleased) }
    validates :release_year, presence: true, if: :song_released?, numericality: { less_than_or_equal_to: 2020 }


    def song_released?
        self.released == true 
    end 
end 