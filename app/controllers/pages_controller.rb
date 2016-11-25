class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @last_meals = Meal.last(3).reverse
  end
end
