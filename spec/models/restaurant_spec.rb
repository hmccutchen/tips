require "rails_helper"

RSpec.describe Restaurant, type: :model do
  describe "validations" do
    it "validates the uniqueness of name within the scope of address" do
      restaurant = Restaurant.new(name: "Restaurant 1", address: "Address 1")
      expect(restaurant).to be_valid

      restaurant.save

      duplicate_restaurant = Restaurant.new(name: "Restaurant 1", address: "Address 1")
      expect(duplicate_restaurant).not_to be_valid
    end

    it "validates the presence of address" do
      restaurant = Restaurant.new(name: "Restaurant 2")
      expect(restaurant).not_to be_valid
      expect(restaurant.errors[:address]).to include("can't be blank")
    end
    it "validates the presence of name" do
      restaurant = Restaurant.new(address: "Address 2")
      expect(restaurant).not_to be_valid
      expect(restaurant.errors[:name]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "has many reviews" do
      restaurant = Restaurant.new(name: "Restaurant 3", address: "Address 3")
      expect(restaurant.reviews).to be_empty

      review = Review.new(content: "Great food!")
      restaurant.reviews << review

      expect(restaurant.reviews).to include(review)
    end

    xit "destroys associated reviews when destroyed" do
      restaurant = Restaurant.create(name: "Restaurant 4", address: "Address 4")
      review = Review.create(content: "Bad service!", restaurant: restaurant)

      expect { restaurant.destroy }.to change { Review.count }.by(-1)
    end
  end
end
