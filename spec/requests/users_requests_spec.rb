require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  context 'Get /users/sign_in' do
    it 'Check if response status was correct' do
      get '/users/sign_in'
      expect(response).to have_http_status(200)
    end
    it 'Check if a correct template was rendered.' do
      get '/users/sign_in'
      expect(response).to render_template(:new)
    end
    it 'Check if the response body includes correct placeholder text.' do
      get '/users/sign_in'
      expect(response.body).to include('Log in')
    end
  end

  context 'Get users/sign_up' do
    it 'Check if response status was correct' do
      get '/users/sign_up'
      expect(response).to have_http_status(200)
    end
    it 'Check if a correct template was rendered.' do
      get '/users/sign_up'
      expect(response).to render_template(:new)
    end
    it 'Check if the response body includes correct placeholder text.' do
      get '/users/sign_up'
      expect(response.body).to include('Sign up')
    end
  end

  context 'Post invaild email' do
    let(:user) { create(email: 'user@example.com') }

    it 'Check if a correct template was rendered.' do
      post '/users/sign_in'
      expect(response).to render_template(:new)
    end
    it 'Check if the response body includes correct placeholder text.' do
      post '/users/sign_in'
      expect(response.body).to include('Log in')
    end
  end
end
