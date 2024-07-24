class PropertiesService
  def conn
    conn = Faraday.new(url: "https://api.simplyrets.com") do |faraday|
      faraday.basic_auth("simplyrets", "simplyrets")
    end
  end
  
  def get_url(url)
    response = conn.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

  def get_listings(city)
    get_url("?city=#{city}&limit=50&sort=-listprice")
  end
end