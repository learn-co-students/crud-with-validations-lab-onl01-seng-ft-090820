class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year }
    validates_uniqueness_of :artist_name, scope: :release_year
    validates :release_year, presence: true, if: :song_released?, numericality: { less_than_or_equal_to: 2020 }
    validates :released, :inclusion => {:in => [true, false]}

    def song_released?
        self.released == true 
    end 
end
