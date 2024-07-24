class PropertiesService
  def conn
    conn = Faraday.new(url: "https://api.simplyrets.com") do |faraday|
      faraday.headers[:Authorization] = "Basic c2ltcGx5cmV0czpzaW1wbHlyZXRz"
    end
  end
  
  def get_url(url)
    response = conn.get(url)
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_listings(city)
    get_url("?cities=#{city}&limit=50&sort=-listprice")
  end
end