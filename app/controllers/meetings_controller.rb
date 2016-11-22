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
    # @meetings = Meeting.all
    @guest_meetings = Meeting.where(user_id: current_user.id)
    @host_meetings = Meeting.host_meetings
    # Meeting.select('meetings.*').joins('meal': { meal_id: :id }).where(user_id: current_user.id)
    # Meeting.select("*").joins(:meal)

# def top_five_artists(genre_name)
#   Artist.select('artists.*, COUNT(tracks.name) AS track_count')
#         .joins(albums: { tracks: :genre }).where(genres: { name: genre_name })
#         .group('artists.name').order('track_count DESC').limit(5)
# end
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

