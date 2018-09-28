class PagesController < ApplicationController





  def home
    @reviews = Review.all



  end



end
