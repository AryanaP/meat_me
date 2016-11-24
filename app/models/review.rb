class Review < ApplicationRecord
  belongs_to :user, through: :meetings
  belongs_to :meeting
end
