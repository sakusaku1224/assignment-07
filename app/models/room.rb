class Room < ApplicationRecord
  # モデルにUploaderを紐付け
  mount_uploader :image, RoomImageUploader
  belongs_to :user
  has_many :reservations, dependent: :destroy
end
