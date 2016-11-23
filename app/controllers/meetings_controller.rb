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
  end


  def update
    @host_meeting = Meeting.where(meeting_params)
    @host_meeting.status = Meeting.find(params[:status])
    render "meetings/index"
  end

  private

  def meeting_params
    params.require(:meeting).permit(:user_id, :meal_id, :status)
  end
end

