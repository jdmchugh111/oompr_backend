class PropertiesFacade
  def oompr_search(city)
    service = PropertiesService.new
    
    listings = service.get_listings(city)
    listings.map do |listing_hash|
      Listing.new(listing_hash)
    end
  end

  def get_listing(id)
    service = PropertiesService.new
    
    Listing.new(service.get_one_listing(id))
  end

  def rc_search(city, maxprice)
    service = PropertiesService.new
    
    listings = service.get_rc_listings(city, maxprice)
    listings.map do |listing_hash|
      Listing.new(listing_hash)
    end
  end
end