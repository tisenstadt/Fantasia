module RatingsHelper
    def average_rating(ratings)
        scores = []
        ratings.each {|rating| scores << rating.score}
        (scores.inject{ |sum, el| sum + el }.to_f / scores.size)
    end
    
    def current_user_has_rated?(user, page)
        user.ratings.each do |rating|
            return true if rating.page_id == page.id
        end
        false
    end
end
