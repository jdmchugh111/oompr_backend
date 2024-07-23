class TestController < ApplicationController
  def index
    response = Faraday.get("https://api.simplyrets.com/properties?q=Houston") do |faraday|
      faraday.headers[:Authorization] = "Basic c2ltcGx5cmV0czpzaW1wbHlyZXRz"
    end
    data = JSON.parse(response.body, symbolize_names: true)
    render json: data.count
  end
end