class FdcService 
  def foods_search(query) 
    get_url("/fdc/v1/foods/search?", {query: query})
  end

  def conn 
    Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.params[:api_key] = ENV["FDC_DATABASE_KEY"]
    end
  end

  def get_url(url, query = nil)
    response = conn.get(url, query)
    JSON.parse(response.body, symbolize_names: true)
  end
end