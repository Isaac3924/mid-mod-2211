class Food
  attr_reader :id,
              :name

  def initialize(params)
    @id = params[:id]
    @name = params[:details]
  end

  def get_details(details)
    
    details_hash = {}

    details_hash[:gtinUpc] = details[:gtinUpc]
    details_hash[:details] = details[:details]
    details_hash[:brandOwner] = details[:brandOwner]
    details_hash[:ingredients] = details[:ingredients]

    details_hash
  end
end