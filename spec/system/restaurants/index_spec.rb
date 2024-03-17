require "rails_helper"

describe "Viewing Restaurants", type: :system do
  let!(:user) { create(:user) }
  let!(:restaurants) { create_list(:restaurant, 5) }



  context "When a user is logged in" do
    it "shows all restaurants" do
      login_as(user)

      visit restaurants_path

      restaurants.each do |restaurant|
        expect(page).to have_content(restaurant.name)
      end
    end
  end

  context "When a user searches for a restuarant" do
    let!(:restaurant) { create(:restaurant, name: "McDonalds") }
    let!(:restaurants) { create_list(:restaurant, 5)}
    it "only shows the restaurant/s searched" do
      login_as(user)
      visit restaurants_path

      restaurants.each do |restaurant|
        expect(page).to have_content(restaurant.name)
      end

      fill_in "search", with: restaurant.name

      click_on "search"

      expect(page).to have_content(restaurant.name)
      expect(page).to have_no_content(restaurants.second.name)
    end
  end
end
