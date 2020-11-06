class Song < ApplicationRecord
    validates :title, presence: true
    validates_with TitleValidator
    validates :artist_name, presence: true
    validates_with ReleaseYearValidator
end
