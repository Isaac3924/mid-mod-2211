class FoodFacade 
  attr_reader :details

   def initialize(search)
    @search = search
  end

  def search_call
    parsed_food_search = service.foods_search(@search)

    
    @total_hits = parsed_food_search[:totalHits]
    
    @results = parsed_food_search[:foods].map do |result|
      Food.new(result)
    end
  end[0..10]

  def service 
     @_service ||= FdcService.new
  end
end