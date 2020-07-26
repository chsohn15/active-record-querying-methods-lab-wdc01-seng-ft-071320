class Show < ActiveRecord::Base

    def self.highest_rating
        Show.maximum(:rating)
    end

    def self.most_popular_show
        top_show = Show.all.find do |show|
            show.rating == Show.highest_rating
        end
        top_show
    end

    def self.lowest_rating 
        Show.minimum(:rating)
    end

    def self.least_popular_show
        Show.all.find do |show|
            show.rating == Show.lowest_rating
        end
    end

    def self.ratings_sum
        Show.sum(:rating)
    end

    def self.popular_shows
        Show.where("rating > ?", 5)
    end

    def self.shows_by_alphabetical_order
        Show.order(name: :asc)
    end

end