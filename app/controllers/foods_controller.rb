class FoodsController < ApplicationController
  def index
    facade = FoodFacade.new(params[:q])
    @total_hits = facade.total_hits
    @foods = facade.get_food
  end
end