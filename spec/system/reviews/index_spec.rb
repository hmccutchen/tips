
require 'rails_helper'

describe "Viewing Reviews", type: :system do
  let!(:user) { create(:user) }
  context "When a user is logged in" do

    let(:restaurant) { create(:restaurant) }
    it "shows all reviews for a restaurant" do
      login_as(user)
      review1 = create(:review, user: user, restaurant: restaurant)
      review2 = create(:review,user: user, title: "Another review", restaurant: restaurant)

      visit root_path

      expect(page).to have_content(review1.title)
      expect(page).to have_content(user.email)
      expect(page).to have_content(review2.title)
    end
    it "allows a user to like a review" do
      login_as(user)
      review = create(:review, user: user, restaurant: restaurant)
      visit root_path

      find(".tips", text: "like").click

      expect(page).to have_content("Remove like")
      expect(review.get_likes.size).to eq(1)
    end
  end
  context "When a user is not logged in" do
    let(:restaurant) { create(:restaurant) }
    fit "does not show the like button" do
      review = create(:review, user: user, restaurant: restaurant)
      review.vote_up user

      visit root_path

      expect(page).to have_no_button("like")
    end
  end
end
