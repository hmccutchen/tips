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

    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_review = @restaurant.reviews.new(review_params)
    @restaurant_review.user = @user


    if @restaurant_review.save
      @user.reviews << @restaurant_review
      redirect_to "/"
    else
      redirect_to restaurant_path(@restaurant)

       flash[:alert] = "Please fill out all fields #{@restaurant_review.errors.full_messages}"

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
