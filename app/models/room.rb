class Room < ApplicationRecord
  # モデルにUploaderを紐付け
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  has_many :reservations, dependent: :destroy
end
