class Booking < ApplicationRecord
   belongs_to :user
   belongs_to :property

   validates :check_in, presence: true
   validates :check_out, presence: true

end
