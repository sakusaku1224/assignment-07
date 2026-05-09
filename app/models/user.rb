class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # モデルにUploaderを紐付け
  mount_uploader :avatar, AvatarUploader
  # リレーションを追加
  has_many :rooms
  has_many :reservations
end
