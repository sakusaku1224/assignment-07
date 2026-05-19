class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  # バリデーション
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :person_num, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :total_price, presence: true, numericality: { greater_than: 0 }
end
