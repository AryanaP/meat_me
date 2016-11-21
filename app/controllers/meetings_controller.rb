class MeetingsController < ApplicationController
  def index
    @guest_meetings = Meeting.where(user_id == current_user.id)
    @host_meetings = Meeting.where(user_id == meals.user)
  end

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

  private

  def meeting_params
    params.require(:meeting).permit(:status)
  end
end

