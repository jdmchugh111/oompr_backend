class Listing
  attr_reader :id,
              :price,
              :address,
              :bedrooms,
              :bathrooms,
              :sqft,
              :photos
              
  def initialize(listing)
    @id = listing[:mlsId]
    @price = listing[:listPrice]
    @address = format_address(listing)
    @bedrooms = listing[:property][:bedrooms]
    @bathrooms = listing[:property][:bathsFull]
    @sqft = listing[:property][:area]
    @photos = listing[:photos]
  end

  def format_address(listing)
    hash = listing[:address]
    "#{hash[:full]}, #{hash[:city]}, #{hash[:state]} #{hash[:postalCode]}"
  end
end