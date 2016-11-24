class Meeting < ApplicationRecord
  belongs_to :meal
  belongs_to :user
  has_many :reviews
end
