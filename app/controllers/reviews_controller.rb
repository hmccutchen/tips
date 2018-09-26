class ReviewsController < ApplicationController



  def index
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.all
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
  end

  def new
    @user = User.find(session[:user_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new

  end


  def create
    @user = User.find(session[:user_id])

    p @user
     @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
     @user.reviews << @review
    if @review.save!
      redirect_to '/'
    else
      render 'new'
    end
  end


  def edit;end
  private

  def review_params
    params.require(:review).permit(:title, :clientele, :management, :tip_avg, :team, :more_details, :shift_description, :rating)
  end


end
