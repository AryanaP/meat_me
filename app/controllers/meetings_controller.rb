class MeetingsController < ApplicationController
  def create
    meal = Meal.find(params[:meal_id])
    meeting = Meeting.new(status: "Pending")
    meeting.user = current_user
    meeting.meal = meal
    meeting.save
    redirect_to meal_meetings_path
  end

  def index
    @guest_meetings = Meeting.where(user_id: current_user.id)
    @host_meetings = Meeting.joins(:meal => :user).where(:users => {:id => current_user.id})
    @my_meals = current_user.meals.sort_by(&:date)
    @my_meetings = @guest_meetings.sort_by do |meeting|
      Meal.find(params[:meal_id]).date
    end
  end

  def update
    @host_meeting = Meeting.find(params[:id])
    @host_meeting.status = params["status"]
    @host_meeting.save
    redirect_to meal_meetings_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:user_id, :meal_id, :status)
  end
end

