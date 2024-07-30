class Favorite < ApplicationRecord
  validates_presence_of :user_id,
                        :listing_id,
                        :picture,
                        :price,
                        :address

  def self.get_all_favorites(user)
    Favorite.select('DISTINCT ON (address) *').where(user_id: user)
  end
end
