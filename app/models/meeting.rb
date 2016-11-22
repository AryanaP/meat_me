class Meeting < ApplicationRecord
  belongs_to :meal
  belongs_to :user

  def self.host_meetings
    joins(meals: :user).where(user: { id: :current_user.id }).distinct
  end

end
