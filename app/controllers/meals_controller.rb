class MealsController < ApplicationController
  before_action :set_meal, only: [ :show, :edit, :update ]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:select] == "all"
      @meals = Meal.all
    else
      @meals = Meal.where(food_type: "#{params[:select].capitalize}")
    end
  end

  def show
    @user = User.find(@meal.user)
  end

  def new
      @meal = Meal.new
  end

  def edit
  end

  def create
      @meal = Meal.new(meal_params)
      @meal.user = current_user
      if @meal.save
        flash[:notice] = 'meal was successfully created'
        redirect_to meal_path(@meal)
      else
        flash[:alert] = 'unprocessable_entity'
        render :new
      end
    end

  def update
      if @meal.update(meal_params)
        flash[:notice] = 'meal was successfully updated'
        redirect_to @meal
      else
        flash[:alert] = 'unprocessable_entity'
        render :edit
      end
  end

 private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:user_id, :name, :address, :city,  :date, :description, :food_type, :meeting_type, photos: [])
  end
end
