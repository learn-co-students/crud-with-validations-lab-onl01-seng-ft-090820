class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :release_year, message: "cannot be repeated in the same year"}
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: :released?, numericality: { less_than: Time.now.year}
    # include ActiveModel::Validations
    # validates_with SongTitleValidator
end
