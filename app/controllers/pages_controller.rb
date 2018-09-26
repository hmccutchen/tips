class PagesController < ApplicationController





  def home
   @review = Review.all
  end



end
