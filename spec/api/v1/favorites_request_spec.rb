require "rails_helper"

describe "create new favorite" do
  it "creates a new favorite when given a user id and a listing id", :vcr do
    post "/api/v1/favorites?user=1&listing=1005172"

    expect(response).to be_successful

    favorite = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(favorite[:type]).to eq("favorite")
    expect(favorite[:attributes][:user_id]).to eq("1")
    expect(favorite[:attributes][:listing_id]).to eq("1005172")
    expect(favorite[:attributes][:address]).to eq("68827 South 99 CT Estates #783, Houston, Texas 77375")
    expect(favorite[:attributes][:price]).to eq("18730333")
    expect(favorite[:attributes][:picture]).to eq("https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home4.jpg")
  end

  it "can delete a record" do
    favorite = Favorite.create(user_id: '1', listing_id: '1', address: '123 Elm Street, Springfield, IL', price: '250000', picture: 'http://example.com/pictures/elm_street.jpg')

    expect(Favorite.count).to eq(1)
  
    delete "/api/v1/favorites/#{favorite.id}"
  
    expect(response).to be_successful
    expect(Favorite.count).to eq(0)
    expect{Favorite.find(favorite.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
  
  describe "sad path" do
    it "can't create a favorite unless both params present", :vcr do
      post "/api/v1/favorites?user=1"

      expect(response).to_not be_successful

      error = JSON.parse(response.body, symbolize_names: true)[:errors][0]

      expect(error[:code]).to eq(400)
      expect(error[:message]).to eq("Params missing")
    end
  end

  describe "get user's favorites" do
    it "can retrieve a unique list of user's favorites", :vcr do
      Favorite.create(user_id: '1', listing_id: '1', address: '123 Elm Street, Springfield, IL', price: '250000', picture: 'http://example.com/pictures/elm_street.jpg')

      get "/api/v1/favorites?user=1"

      favorites = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(favorites).to be_a Array
      expect(favorites[0]).to be_a Hash
      
      first = favorites[0]

      expect(first[:type]).to eq("favorite")
      expect(first[:attributes]).to be_a Hash
      expect(first[:attributes][:user_id]).to eq("1")
      expect(first[:attributes][:listing_id]).to be_a String
      expect(first[:attributes][:address]).to be_a String
      expect(first[:attributes][:price]).to be_a String
      expect(first[:attributes][:picture]).to be_a String
    end
  end
end

