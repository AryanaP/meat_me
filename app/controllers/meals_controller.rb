class MealsController < ApplicationController
  before_action :set_meal, only: [ :show, :edit, :update ]

  def index
    @meals = Meal.all
  end

  def show
  end

  def new
      @meal = Meal.new
  end

  def edit
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

    def update
      respond_to do |format|
        if @meal.update(meal_params)
          format.html { redirect_to @meal, notice: 'meal was successfully updated.' }
          format.json { render :show, status: :ok, location: @meal }
        else
          format.html { render :edit }
          format.json { render json: @meal.errors, status: :unprocessable_entity }
        end
      end
    end

 private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :address, :city,  :date, :description, :food_type, :meeting_type)
  end
end
