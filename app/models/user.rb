class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :properties, through: :bookings

  Roles = [:admin, :user]

  def is?( requested_role )
    self.role == requested_role.to_s
  end
end
