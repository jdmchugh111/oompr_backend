require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :listing_id }
    it { should validate_presence_of :address }
    it { should validate_presence_of :price }
    it { should validate_presence_of :picture }
  end

  describe "get_all_favorites" do
    it "should get all favorites with a distinct address when passed a user_id" do
      favorite1 = Favorite.create(user_id: '1', listing_id: '1', address: '123 Elm Street, Springfield, IL', price: '250000', picture: 'http://example.com/pictures/elm_street.jpg')
      favorite2 = Favorite.create(user_id: '1', listing_id: '2', address: '456 Oak Avenue, Springfield, IL', price: '350000', picture: 'http://example.com/pictures/oak_avenue.jpg')
      favorite3 = Favorite.create(user_id: '1', listing_id: '3', address: '789 Maple Road, Springfield, IL', price: '275000', picture: 'http://example.com/pictures/maple_road.jpg')
      favorite4 = Favorite.create(user_id: '1', listing_id: '3', address: '789 Maple Road, Springfield, IL', price: '275000', picture: 'http://example.com/pictures/maple_road.jpg')

      favorites = Favorite.get_all_favorites('1')

      expect(favorites).to eq([favorite1, favorite2, favorite3])
    end
  end
end
