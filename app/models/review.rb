class Review < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :customer
    
    def full_review
        "Review for #{self.restaurant.name} by #{self.customer.full_name}: #{self.star_rating} star#{self.star_rating>1 ? "s" : "" }."
    end
end