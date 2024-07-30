require "rails_helper"

RSpec.describe FavoritesFacade do
  it "exists" do
    facade = FavoritesFacade.new
    expect(facade).to be_a FavoritesFacade
  end

  it "can create a new favorite entry when passed a user id and liting id", :vcr do
    facade = FavoritesFacade.new
    facade.create_favorite("1", "1005172")

    favorite = Favorite.last

    expect(favorite).to be_a Favorite
    expect(favorite.user_id).to eq("1")
    expect(favorite.listing_id).to eq("1005172")
  end
end