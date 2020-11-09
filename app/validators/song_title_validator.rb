class SongTitleValidator < ActiveModel::Validator
    def validate
        if Song.any? {|s| s.title == record.title &&
            s.artist_name == record.artist_name &&
            s.release_year == record.release_year}

            record.errors[:title] << "cannot be repeated by the same artist in the same year"
        end
    end
end 