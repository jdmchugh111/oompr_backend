require "rails_helper"

RSpec.describe Listing do
  it "exists", :vcr do
    conn = Faraday.new("https://api.simplyrets.com") do |faraday|
      faraday.request :authorization, :basic, 'simplyrets', 'simplyrets'
    end
    response = conn.get("/properties?cities=Houston")
    data = JSON.parse(response.body, symbolize_names: true)
    listing = Listing.new(data[0])

    expect(listing).to be_a Listing
    expect(listing.id).to eq(1005192)
    expect(listing.price).to eq(20714261)
    expect(listing.address).to eq("74434 East Sweet Bottom Br #18393, Houston, Texas 77096")
    expect(listing.bedrooms).to eq(2)
    expect(listing.bathrooms).to eq(5)
    expect(listing.sqft).to eq(1043)
    expect(listing.photos).to eq([
                                "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home9.jpg",
                                "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home-inside-9.jpg"
                                  ])
  end
end