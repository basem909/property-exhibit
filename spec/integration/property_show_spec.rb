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
  end

  context 'property show page test' do
    before(:example) do
      visit property_path(property.id)
    end

    it 'checks the property image exist' do
      expect(page).to have_selector 'img'
    end

    it 'checks the site benfits r on the screen' do
      expect(page).to have_selector 'h5', text: 'We offer'
      expect(page).to have_selector 'li', text: 'Free cancellation on nearly all units.'
    end

    it 'the user can navigate back to properties list or forward to book' do
      expect(page).to have_selector 'a', text: 'Back to properties'
      expect(page).to have_selector 'a', text: 'Book this property'
    end

    it 'the user can delete the property or edit it' do
      expect(page).to have_selector 'a', text: 'Edit this property'
      expect(page).to have_selector 'button', text: 'Delete this property'
    end

    it 'redirects to properties list when the user tabs on back link' do
      first('.back').click_link('Back to properties')
      sleep(1)
      expect(page).to have_text('Find')
      expect(page).to have_text('Add')
    end
    it 'redirects to book the current property ' do
      first('.book').click_link('Book this property')
      sleep(1)
      expect(page).to have_text('Check in')
      expect(page).to have_text('Check out')
    end
  end
end
