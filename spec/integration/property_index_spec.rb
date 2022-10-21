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

  end


  context 'property index page test' do
    before(:example) do
      visit '/properties/'
    end

    it 'display the number of available properties' do
      expect(page).to have_text('Find what suits you within our')
    end

    it "checks the logo image exist" do
      expect(page).to have_selector 'img'
    end

    it 'can see the link to bookings' do
      expect(page).to have_text('My Bookings')
    end

    it 'checks that the properties exist' do
      expect(page).to have_selector 'a', text: 'Add a new property'
      expect(page).to have_selector 'article'
    end
  end
end