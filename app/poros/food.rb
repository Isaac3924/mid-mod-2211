class Food
  attr_reader :gtinUpc,
              :details,
              :brandOwner,
              :ingredients

  def initialize(params)
    gtinUpc = params[:gtinUpc]
    details = params[:description]
    brandOwner = params[:brandOwner]
    ingredients = params[:ingredients]
  end
end