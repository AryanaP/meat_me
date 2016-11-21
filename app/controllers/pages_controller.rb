class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @meals = Meal.all
    @last_meals = @meals.last(3)
  end
end
