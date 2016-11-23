class Meal < ApplicationRecord
  belongs_to :user
  has_many :meetings

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  has_attachments :photos, maximum: 5
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :food_type, presence: true
  validates :meeting_type, presence: true

end
