class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :user_id, :listing_id, :address, :price, :picture
end
