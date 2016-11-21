class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :meals, dependent: :destroy
  has_many :dates

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :gender, presence:true
  # validates :photo, presence:true
  validates :description, presence:true


end
