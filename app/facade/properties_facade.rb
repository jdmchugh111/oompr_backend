class PropertiesFacade
  def oompr_search(city)
    service = PropertiesService.new

    listings = service.get_listings(city).map do |listing_hash|
      Listing.new(listing_hash)
    end
  end
end