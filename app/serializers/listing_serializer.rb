class ListingSerializer
  include JSONAPI::Serializer
  attributes :price, :address, :bedrooms, :bathrooms, :sqft, :photos
end
