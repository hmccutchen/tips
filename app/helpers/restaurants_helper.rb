module RestaurantsHelper
  def new_address_format(address)
    new_address = address.delete! "[]"
    new_address.gsub! /"/, ""
    new_address
  end
end
