class Booking < ApplicationRecord
   belongs_to :user
   belongs_to :property, class_name: 'Property'

   validates :check_in, presence: true
   validates :check_out, presence: true

end
