class Property < ApplicationRecord
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, presence: true, length: { in: 6..128 }
  validates :description, presence: true
  validates :address, presence: true
  validates :photos, presence: true, length: { in: 3..5, message: ' min 3 and max 5 for property' }
end
