require "rails_helper"

RSpec.describe PropertiesFacade do
  it "exists" do
    facade = PropertiesFacade.new
    expect(facade).to be_a PropertiesFacade
  end
  describe "#oompr_search" do
    it "can return an array of listing poros when givien a city param", :vcr do
      facade = PropertiesFacade.new

      results = facade.oompr_search("Houston")
      expect(results).to be_a Array 
      expect(results[0]).to be_a Listing
    end
  end

  describe "#get_listing" do
    it "can return one listing poro if given an id param", :vcr do
      facade = PropertiesFacade.new

      result = facade.get_listing("1005172")
      expect(result).to be_a Listing
    end
  end

  describe "#rc_search" do
    it "can return an array of listing poros when given city and maxprice params", :vcr do
      facade = PropertiesFacade.new

      results = facade.rc_search("Houston", "20000000")
      expect(results).to be_a Array 
      expect(results[0]).to be_a Listing
      expect(results[0].price).to eq(18730333)
    end
  end

  describe "#get_max" do
    it "can return maxprice if given monthly income" do
      facade = PropertiesFacade.new

      expect(facade.get_max("375000")).to eq(20000000)
    end
  end
end