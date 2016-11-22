class Meeting < ApplicationRecord
  belongs_to :meal
  belongs_to :user
  # def self.host_meetings
  #   joins(:meals).where(meal.user_id == current_user.id)
  # end

end
