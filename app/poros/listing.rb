class Listing
  def initialize(listing)
    @id = listing[:listingId]
    @price = listing[:listPrice]
    @address = format_address(listing)
    @bedrooms = listing[:property][:bedrooms]
    @bathrooms = listing[:property][:bathsFull]
    @sqft = listing[:property][:area]
    @photos = listing[:photos]
  end

  def format_address(listing)
    "#{listing[:address][:full]}, #{listing[:city]}, #{listing[:state]} #{listing[:postalCode]}"
  end
end