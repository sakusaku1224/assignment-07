class Room < ApplicationRecord
  # モデルにUploaderを紐付け
  mount_uploader :image, RoomImageUploader
  belongs_to :user
  has_many :reservations, dependent: :destroy
  # バリデーション
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality: { greater_than: 1 }
  validates :address, presence: true
end
