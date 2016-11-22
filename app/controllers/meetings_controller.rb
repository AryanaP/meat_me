class MeetingsController < ApplicationController
  def create
    meal = Meal.find(params[:id])
    @meeting = Meeting.create(status: "Pending")
    @meeting.user = current_user
    @meeting.meal = meal
  end

  def index
    @meetings = Meeting.all
    @guest_meetings = Meeting.where(user_id: current_user.id)
    @host_meetings = Meeting.where(user_id: current_user.id)
  end

  def update

    def approve
      @host_meeting = Meeting.where(meeting_params)
      @host_meeting.status = "Approved"
      render "meetings/index"
    end

    def deny
      @host_meeting = Meeting.find(meeting_params)
      @host_meeting.status = "Denied"
      render "meetings/index"
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:user_id, :meal_id, :status)
  end
end

