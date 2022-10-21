require 'rails_helper'

RSpec.describe Property, type: :request do
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


  it 'is receiving an Ok response from the server' do
    get '/properties/' 
    expect(response).to have_http_status(200)
  end

  it 'renders index template correctly' do
    get '/properties/'
    expect(response).to render_template('index')
  end
  it 'Check if the response body includes correct placeholder text.' do
      get '/properties/'
      expect(response.body).to include('Show this property')
    end

end
