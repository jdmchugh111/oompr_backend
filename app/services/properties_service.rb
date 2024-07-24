class PropertiesService
  def conn
    conn = Faraday.new(url: "https://api.simplyrets.com") do |faraday|
      faraday.request :authorization, :basic, 'simplyrets', 'simplyrets'
    end
  end
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_listings(city)
    get_url("/properties?cities=#{city}&limit=50&sort=-listprice")
  end
end