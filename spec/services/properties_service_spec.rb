require "rails_helper"

describe PropertiesService do
  describe "#get_listing" do
    it "can return a list of a specific city's listing sorted by most expensive", :vcr do
      service = PropertiesService.new
      results = service.get_listings("Houston")

      expect(results).to be_a Array 
      expect(results[0]).to be_a Hash 
      
      listing = results[0]

      expect(listing).to have_key :mlsId
      expect(listing[:mlsId]).to be_a Integer

      expect(listing).to have_key :listPrice
      expect(listing[:listPrice]).to be_a Integer

      expect(listing).to have_key :address
      expect(listing[:address]).to have_key :full
      expect(listing[:address][:full]).to be_a String
      expect(listing[:address]).to have_key :city
      expect(listing[:address][:city]).to be_a String
      expect(listing[:address]).to have_key :state
      expect(listing[:address][:state]).to be_a String
      expect(listing[:address]).to have_key :postalCode
      expect(listing[:address][:postalCode]).to be_a String

      expect(listing).to have_key :property
      expect(listing[:property]).to have_key :bedrooms
      expect(listing[:property][:bedrooms]).to be_a Integer
      expect(listing[:property]).to have_key :bathsFull
      expect(listing[:property][:bathsFull]).to be_a Integer
      expect(listing[:property]).to have_key :area
      expect(listing[:property][:area]).to be_a Integer

      expect(listing).to have_key :photos
      expect(listing[:photos]).to be_a Array
      expect(listing[:photos][0]).to be_a String

      expect(results[0][:listPrice]).to be >= results[1][:listPrice]
    end
  end

  describe "#get_rc_listings" do
    it "can return filtered search results based on a maxprice", :vcr do
      service = PropertiesService.new
      results = service.get_rc_listings("Houston", 20000000)

      expect(results[0][:listPrice]).to be <= 20000000
    end
  end

  describe "#get_one_listing" do
    it "can return a single listing if given an mlsId", :vcr do
      service = PropertiesService.new
      listing = service.get_one_listing("1005254")

      expect(listing).to be_a Hash

      expect(listing).to have_key :mlsId
      expect(listing[:mlsId]).to be_a Integer

      expect(listing).to have_key :listPrice
      expect(listing[:listPrice]).to be_a Integer

      expect(listing).to have_key :address
      expect(listing[:address]).to have_key :full
      expect(listing[:address][:full]).to be_a String
      expect(listing[:address]).to have_key :city
      expect(listing[:address][:city]).to be_a String
      expect(listing[:address]).to have_key :state
      expect(listing[:address][:state]).to be_a String
      expect(listing[:address]).to have_key :postalCode
      expect(listing[:address][:postalCode]).to be_a String

      expect(listing).to have_key :property
      expect(listing[:property]).to have_key :bedrooms
      expect(listing[:property][:bedrooms]).to be_a Integer
      expect(listing[:property]).to have_key :bathsFull
      expect(listing[:property][:bathsFull]).to be_a Integer
      expect(listing[:property]).to have_key :area
      expect(listing[:property][:area]).to be_a Integer

      expect(listing).to have_key :photos
      expect(listing[:photos]).to be_a Array
      expect(listing[:photos][0]).to be_a String
    end
  end
end