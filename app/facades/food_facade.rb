class FoodFacade 
  attr_reader :details

   def initialize(search)
    @search = search
  end

  def search_call
    parsed_food_search = service.foods_search(@search)
  end

  def total_hits
    total_hits = search_call[:totalHits]
  end

  def get_food
    foods = search_call[:foods].map do |result|
      Food.new(result)
    end
  end

  def service 
     @_service ||= FdcService.new
  end
end