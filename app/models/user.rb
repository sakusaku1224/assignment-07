class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # モデルにUploaderを紐付け
  mount_uploader :avatar, AvatarUploader
  # リレーション
  has_many :rooms
  has_many :reservations

  # バリデーション
  validates :name, presence: true, length: { maximum: 20 }
  validates :bio, length: { maximum: 140 }
end
