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
  validates :date, presence: true

  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

end

