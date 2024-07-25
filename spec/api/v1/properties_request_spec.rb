require "rails_helper"

describe "oompr search results" do
  it "sends a list of the most expensive homes in a city", :vcr do
    get "/api/v1/properties?city=Houston"

    expect(response).to be_successful

    listings = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(listings.count).to be <= 50

    listings.each do |listing|
      expect(listing).to have_key :id
      expect(listing[:id]).to be_a String

      expect(listing).to have_key :type
      expect(listing[:type]).to eq("listing")

      expect(listing).to have_key :attributes
      expect(listing[:attributes]).to be_a Hash

      expect(listing[:attributes]).to have_key :price
      expect(listing[:attributes][:price]).to be_a Integer
      expect(listing[:attributes]).to have_key :address
      expect(listing[:attributes][:address]).to be_a String
      expect(listing[:attributes]).to have_key :bedrooms
      expect(listing[:attributes][:bedrooms]).to be_a Integer
      expect(listing[:attributes]).to have_key :bathrooms
      expect(listing[:attributes][:bathrooms]).to be_a Integer
      expect(listing[:attributes]).to have_key :sqft
      expect(listing[:attributes][:sqft]).to be_a Integer
      expect(listing[:attributes]).to have_key :photos
      expect(listing[:attributes][:photos]).to be_a Array
    end
  end
  
  describe "get reality check listings" do
    it "should return list of filtered listings based on monthly income param", :vcr do
      get "/api/v1/properties?city=Houston&monthly=375000"

      expect(response).to be_successful

      listings = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(listings.count).to be <= 50

      expect(listings[0][:attributes][:price]).to be <= 20000000
    end
  end

  describe "get one listing" do
    it "should return a single listing if given a specific id", :vcr do
      get "/api/v1/properties/1005254"

      expect(response).to be_successful

      listing = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(listing).to be_a Hash

      expect(listing).to have_key :id
      expect(listing[:id]).to be_a String

      expect(listing).to have_key :type
      expect(listing[:type]).to eq("listing")

      expect(listing).to have_key :attributes
      expect(listing[:attributes]).to be_a Hash

      expect(listing[:attributes]).to have_key :price
      expect(listing[:attributes][:price]).to be_a Integer
      expect(listing[:attributes]).to have_key :address
      expect(listing[:attributes][:address]).to be_a String
      expect(listing[:attributes]).to have_key :bedrooms
      expect(listing[:attributes][:bedrooms]).to be_a Integer
      expect(listing[:attributes]).to have_key :bathrooms
      expect(listing[:attributes][:bathrooms]).to be_a Integer
      expect(listing[:attributes]).to have_key :sqft
      expect(listing[:attributes][:sqft]).to be_a Integer
      expect(listing[:attributes]).to have_key :photos
      expect(listing[:attributes][:photos]).to be_a Array
    end
  end
end