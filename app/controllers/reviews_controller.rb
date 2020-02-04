class ReviewsController < ApplicationController



  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end


  def create
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_review = @restaurant.reviews.new(review_params)
    user_reviews = @user.reviews

     user_reviews << @review

    if @review.save!
      redirect_to '/'
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :role, :clientele, :management, :tip_avg, :team, :more_details, :shift_description, :rating)
  end


end
