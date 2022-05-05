class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers


    def Restaurant.fanciest
        self.order("price DESC").take(1)
    end

    def all_reviews
        self.reviews.map do |rev|
            "Review for #{self.name} by #{rev.customer.full_name}: #{rev.star_rating} star#{rev.star_rating>1 ? "s" : "" }."
        end
    end

end