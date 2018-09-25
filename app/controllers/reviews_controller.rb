class ReviewsController < ApplicationController



  def index
  end

  def show
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new

  end


  def create
     @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    if @review.save
      redirect_to 'root'
    else
      render 'new'
    end
  end


  def edit;end
  private

  def review_params
    params.require(:review).permit(:title, :clientele, :management, :team, :more_details, :shift_description, :rating)
  end


end
