class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :hunts, dependent: :destroy
  has_many :chat_rooms, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, presence: true
  validates :email, :nickname, uniqueness: true

  def name
    nickname
  end
end
