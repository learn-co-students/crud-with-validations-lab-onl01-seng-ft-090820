require 'pry'
class TitleValidator < ActiveModel::Validator
    def validate(record)
        matching = Song.all.select do |song|
            song.title == record.title && song.release_year == record.release_year && song.artist_name = record.artist_name
        end
        if matching.length > 0
            record.errors[:title] << "An artist cannot release multiple songs with the same title in the same year!"
        end
    end
end