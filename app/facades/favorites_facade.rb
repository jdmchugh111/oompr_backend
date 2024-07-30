class FavoritesFacade
  def create_favorite(user, list_id)
    service = PropertiesService.new
    listing = service.get_one_listing(list_id)
    address = format_address(listing)

    Favorite.create(user_id: user, 
                listing_id: list_id,
                address: address, 
                price: listing[:listPrice],
                picture: listing[:photos][0])
  end

  def format_address(listing)
    hash = listing[:address]
    "#{hash[:full]}, #{hash[:city]}, #{hash[:state]} #{hash[:postalCode]}"
  end
end