require 'rails_helper'

RSpec.describe 'Properties index testing', js: true, type: :system do
  let(:user) { User.create!(password: 'Daniel', email: 'daniel@gmail.com') }
  let(:property) do
    Property.new(description: 'A view that you will never get tired of', name: 'A very nice house by lake',
                 address: '123 avenue,aavenue,city')
  end
  before do
    sign_in(user)
    photo1 = Rails.root.join('app', 'assets', 'images', 'house-cover-4.jpeg')
    photo2 = Rails.root.join('app', 'assets', 'images', 'house-cover-6.jpeg')
    photo3 = Rails.root.join('app', 'assets', 'images', 'house-cover-7.webp')
    property.photos.attach(io: File.open(photo1), filename: 'house-cover-4.jpeg')
    property.photos.attach(io: File.open(photo2), filename: 'house-cover-6.jpeg')
    property.photos.attach(io: File.open(photo3), filename: 'house-cover-7.webp')
    property.save
    @booking = Booking.create!(user:, property:, check_in: '12/12/2022', check_out: '1/1/2023')
  end

  context 'Booking index page test' do
    before(:example) do
      visit '/my_bookings/'
    end

    it 'display the number of available properties' do
      expect(page).to have_text('You have')
    end

    it 'checks the logo image exist' do
      expect(page).to have_selector 'img'
    end

    it 'can see the link to properties' do
      expect(page).to have_text('properties')
    end

    it 'checks that the bookings exist' do
      expect(page).to have_selector 'a', text: 'Show this booking'
      expect(page).to have_selector 'h4'
    end
  end
end
