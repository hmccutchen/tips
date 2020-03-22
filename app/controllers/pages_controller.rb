class PagesController < ApplicationController

skip_before_action :verify_authenticity_token

  def home
    #probably shoukdnt use a shuffle here? belongs in Vue/View
    @reviews = Review.all.shuffle

    @user = current_user
  end

  def like
    @user = current_user

    @review = Review.find(params[:id])
    @review.liked_by @user
  end

  def unlike
    @user = current_user

    @review = Review.find(params[:id])
    @review.unliked_by @user
  end

  def dislike
    @user = current_user

    @review = Review.find(params[:id])
    @review.disliked_by @user
  end

  def show
    @review = Review.find(params[:id])
  end
end
