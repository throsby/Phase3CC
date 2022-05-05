class Customer < ActiveRecord::Base
    has_many :restaurants
    has_many :reviews

    def full_name
        return "#{self.first_name} #{self.last_name}"
    end

    def favorite_restaurant
        return self.reviews.order("star_rating DESC").take(1)
    end

    def add_review (restaurant, rating)
        Review.create(star_rating: rating, restaurant_id: restaurant.id, customer_id: self.id)
    end

    def delete_reviews(restaurant)
        Review.all.where(restaurant_id: restaurant.id, customer_id: self.id).each do |rev|            
            Review.destroy(rev.id)
        end
    end
end