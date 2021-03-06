class ReviewsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @reviews = Review.all.where(restaurant_id: @review.restaurant_id)
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_review = @restaurant.reviews.new(review_params)

    @user.reviews << @restaurant_review

    if @restaurant_review.save
      redirect_to "/"
    else
      render "new"
    end
  end

  def update
    @user = current_user
    @review = Review.find(params[:id])
    @review.update(review_params)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy


  end


  private

  def review_params
    params.require(:review).permit(:title, :role, :clientele, :management, :tip_avg, :team, :more_details, :content, :rating, :comments)
  end
end
