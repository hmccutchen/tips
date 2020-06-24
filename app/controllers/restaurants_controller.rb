class RestaurantsController < ApplicationController
  def index
    @results = params[:search] || nil

    http_call = Curl.get("https://api.yelp.com/v3/businesses/search?&term=#{@results}&location=New+York") do |http|
      http.headers["Authorization"] = "Bearer #{ENV['Yelp_Api_Key']}"
    end
    restaurant_data = JSON.parse(http_call.body_str)

    restaurant_data["businesses"].each do |restaurant|
      restaurant["image_url"]
      restaurant["name"]
      restaurant["categories"][0].try(:title)
      restaurant["price"]
      restaurant["location"]["display_address"]
      restaurant["display_phone"]
      restaurant["rating"]
      restaurant["image_url"]

      restaurant_save_data(restaurant)
    end

    @restaurants = Restaurant.where(Restaurant.arel_table[:name].lower.matches("%#{@results}%"))
    @restaurants ||= Restaurant.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def show
    @review = Review.new
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_save_data(restaurant)
    # so this will save api data and eliminate the punctuation
    # unfortunatley I still have top query data the same way its saved in the database
    @restaurant = Restaurant.new(
      name: restaurant["name"],
      picture: restaurant["image_url"],
      address: restaurant["location"]["display_address"],
      res_type: restaurant["categories"][0].try(:title),
      phone_number: restaurant["display_phone"],
      price_range: restaurant["price"],
      hours: restaurant["hours"],
    )

    if @restaurant.save
      p "saved"
    else
      p "not saved"
    end
  end
end
