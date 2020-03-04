class Movie < ActiveRecord::Base
    # Generate the ratings hash
    def self.ratings
        Movie.select(:rating).distinct.inject([]) { |a, m| a.push m.rating}
    end

end
