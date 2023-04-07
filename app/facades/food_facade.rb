class FoodFacade 
  attr_reader :details

   def initialize(search)
    @search = search
  end

  def search_call
    parsed_food_search = service.foods_search(@search)

    @results = parsed_food_search[:results].map do |result|
      Food.new(result)
    end
  end

  def get_movie_details(food_id)
    parsed_details = service.details_call(movie_id)
    parsed_credits = service.credits_call(movie_id)
    parsed_reviews = service.reviews_call(movie_id)
    
    initialized_params = {:id => movie_id, 
                          :original_title => parsed_details[:original_title],
                          :vote_average => parsed_details[:vote_average]
                          }
   
    movie = Movie.new(initialized_params)

    @details = movie.get_details(parsed_details)
    @reviews = movie.get_reviews(parsed_reviews)
    @credits = movie.get_credits(parsed_credits) 
  end

  def service 
     @_service ||= FdcService.new
  end
end