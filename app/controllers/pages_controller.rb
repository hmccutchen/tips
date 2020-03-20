class PagesController < ApplicationController

skip_before_action :verify_authenticity_token


  def home
    @reviews = Review.all

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

# not sure I want to use a dislike button but If I do these are the methods already built and working for them.

# def dislike
#   @user = current_user

# @review = Review.find(params[:id])
#   @notip = @review.downvote_from @user
#   redirect_to '/'

# end

# def undislike
# @user = current_user

# @review = Review.find(params[:id])
#    @review.undisliked_by @user
#   redirect_to '/'

# end







end
