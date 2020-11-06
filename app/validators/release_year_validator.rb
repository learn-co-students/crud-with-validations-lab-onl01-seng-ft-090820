require 'pry'
class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        if record.released?
            # binding.pry
            if !record.release_year
                record.errors[:release_year] << "A released song must have a release year"
            elsif record.release_year > Date.current.year
                record.errors[:release_year] << "This date hasn't happened yet!"
            end
        end
    end
end