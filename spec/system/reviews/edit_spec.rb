require "rails_helper"

describe "Editing Review", type: :system do
  context "A logged in user can edit their reviews" do
    let!(:user) { create(:user) }
    let!(:restaurant) { create(:restaurant) }
    let!(:review) { create(:review, user: user, restaurant: restaurant) }

    before(:each) do
      login_as(user)
    end

    it "allows a user to edit their review" do
      visit user_path(user)


      fill_in "review_title", with: "New Title"

       fill_in "review_tip_avg", with: 20
          select("Server", from: "review_role")

          find("#clientele4").click

          find("#team4").click
          find("#mange4").click
          find("#rate5").click


          find("trix-editor").click.set("This is a great place to work")

      click_on "Update Review"

      expect(page).to have_content("New title has been updated!")
    end
  end

  context "A user can destroy their review" do
    let!(:user) { create(:user) }
    let!(:restaurant) { create(:restaurant) }
    let!(:review) { create(:review, user: user, restaurant: restaurant) }

    before(:each) do
      login_as(user)
    end

    it "allows a user to destroy their review" do
      visit user_path(user)

      existing_reviews = Review.all.reload.count

      accept_confirm do
         click_on "Delete Review"

      end

      expect(page).to have_content(user.email)
      expect(Review.all.count).to eq(0)
    end
  end
end
