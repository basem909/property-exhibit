class Property < ApplicationRecord
  has_many_attached :photos

  validates :name, presence: true, length: { in: 6..128 }
  validates :description, presence: true
  validates :adress, presence: true
  validates :photos, presence: true, length: { in: 3..5 }
end
