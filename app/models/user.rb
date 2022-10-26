class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :properties, through: :bookings

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  ROLES = %w[admin user].freeze
  def is?(requested_role)
    role == requested_role.to_s
  end

  def admin?
    is?('admin')
  end
end
