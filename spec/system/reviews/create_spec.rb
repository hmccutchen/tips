require 'rails_helper'

describe "Creating Reviews", type: :system do
  let!(:user) { create(:user) }

  before(:each) do
    login_as(user)
  end

  context "With valid input" do
    let!(:restaurant) { create(:restaurant) }

    it "allows a user to add a new review" do
          visit restaurant_path(restaurant)

          fill_in "review_title", with: "Great Place"
          fill_in "review_tip_avg", with: 20
          select("Server", from: "review_role")

          find("#clientele4").click

          find("#team4").click
          find("#mange4").click
          find("#rate5").click


          find("trix-editor").click.set("This is a great place to work")

          click_on "submit"

          expect(page).to have_content(restaurant.name)
          expect(Review.last.reload.title).to eq("Great Place")
    end
  end

  context "With invalid input" do
    let!(:restaurant) { create(:restaurant, name: "Chickfila") }
    it "does not allow a user to add a new review and shows an error message" do
      visit restaurant_path(restaurant)

          fill_in "review_tip_avg", with: 20
          select("Server", from: "review_role")

          find("#clientele4").click

          find("#team4").click
          find("#mange4").click
          find("#rate5").click


          find("trix-editor").click.set("This is a great place to work")

          click_on "submit"
        expect(page).to have_content("lease fill out all fields [\"Title can't be blank\"]")
        expect(Review.last).to eq(nil)
    end
  end
end
