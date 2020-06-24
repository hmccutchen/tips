module RestaurantsHelper
  def new_address_format(address)

     unless address.nil?
      new_address = address.delete! "[]"
      new_address.gsub! /"/, ""
      new_address
     else
      address
    end
  end
end
