class FdcService 
  def foods_search(query) 
    get_url("/3/movie/top_rated")
  end

  def conn 
    Faraday.new(url: "https://api.nal.usda.gov/fdc/") do |faraday|
      faraday.params[:api_key] = ENV["MOVIE_DATABASE_KEY"]
    end
  end

  def get_url(url, query = nil)
    response = conn.get(url, query)
    JSON.parse(response.body, symbolize_names: true)
  end
end