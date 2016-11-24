class Review < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  validates :user, uniqueness: { scope: :meeting,
    message: "You can review a meeting only once" }
end
