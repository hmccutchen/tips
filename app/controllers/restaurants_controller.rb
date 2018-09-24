class RestaurantsController < ApplicationController


API_KEY = "mY9ou23owK6ViN4MQnkI1o-z7ksAicUDyV4Q_0Dq2Qm829nDuxlPrTQo-Vc5kU9jZlmdmoJ7p4o3Mabc9BYxPVpIKv3PnOfyCzU4S7r2SdxuJ4bE612sNNj4BEBvW3Yx"


  def index
@results = params[:q]
# @address = params[:a]

http = Curl.get("https://api.yelp.com/v3/businesses/search?&term=#{@results}&location=New+York") do |http|
  http.headers["Authorization"] = "Bearer #{API_KEY}"
end
 @r = JSON.parse(http.body_str)
 p @r
 # @res_name = @r["businesses"][0]["name"]
 # @res_location = @r["businesses"][0]["location"]["display_address"]
 # @res_rating = @r["businesses"][0]["rating"]
 # @res_phone = @r["businesses"][0]["display_phone"]
 # @res_price = @r["businesses"][0]["price"]
 # @res_cat = @r["businesses"][0]["categories"][0]["title"]

  end

def search; end





  def new
  end

  def show
  end

  def edit
  end




private


end
