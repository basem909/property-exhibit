require 'rails_helper'

RSpec.describe 'Properties index testing', js: true, type: :system do
 let(:user) { User.create!(password: 'Daniel', email: 'daniel@gmail.com') }
  let(:property) { Property.new(description: 'A view that you will never get tired of', name: 'A very nice house by lake', address: '123 avenue,aavenue,city')}
   before do
    sign_in(user)
    photo1 = Rails.root.join( 'app', 'assets', 'images', 'house-cover-4.jpeg')
    photo2 = Rails.root.join( 'app', 'assets', 'images', 'house-cover-6.jpeg')
    photo3 = Rails.root.join( 'app', 'assets', 'images', 'house-cover-7.webp')
    property.photos.attach(io: File.open(photo1), filename: 'house-cover-4.jpeg')
    property.photos.attach(io: File.open(photo2), filename: 'house-cover-6.jpeg')
    property.photos.attach(io: File.open(photo3), filename: 'house-cover-7.webp')
    property.save
    @booking = Booking.create!(user: user, property: property, check_in: '12/12/2022', check_out: '1/1/2023')

  end

  context 'booking show page test' do
    before(:example) do
      visit property_booking_path(property.id, @booking.id)
    end

    it "checks the booking image exist" do
      expect(page).to have_selector 'img'
    end

    it 'checks the booking location and name are on the screen' do
      expect(page).to have_selector 'label', text: 'Property:'
      expect(page).to have_selector 'label', text: 'Located at:'
    end

    it 'the user can navigate back to Bookings list or forward to book' do
      expect(page).to have_selector 'a', text: 'Back to bookings'
      
    end

    it 'the user can delete the property or edit it' do
      expect(page).to have_selector 'button', text: 'Cancel this booking'
    end

    it 'redirects to book the current property ' do
      first('.link').click_link('Back to bookings')
      sleep(1)
      expect(page).to have_text('You have')
      expect(page).to have_text('Back to properties')
    end
  end
end