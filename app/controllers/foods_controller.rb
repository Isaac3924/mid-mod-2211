class FoodsController < ApplicationController
  def index
    facade = FoodFacade.new(params[:q])
    @foods = facade.search_call
    require 'pry'; binding.pry
  end
end