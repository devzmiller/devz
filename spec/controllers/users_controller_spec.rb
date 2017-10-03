require 'spec_helper'

describe 'UsersController' do
  describe '/users/new' do
    it 'returns 200 status' do
      get '/users/new'
      expect(last_response.status).to eq 200
    end
  end

  describe 'post /users' do
    it 'returns a 302 +-1 status' do
      post '/users', {user: {name: "Hamilton Hamstein", email: "ham@ham.com", password: "ham"}}
      expect(last_response.status).to be_within(1).of(302)
    end
    it 'creates a new user' do
      post '/users', {user: {name: "Hamilton Hamstein", email: "ham@ham.com", password: "ham"}}
      user = User.find_by_email("ham@ham.com")
      expect(user).to_not be_nil
    end
    it 'if user is invalid, display errors' do
      post '/users', {user: {name: "Hamilton Hamstein", email: "ham@ham.com"}}
      expect(last_response.status).to eq 200
    end
  end
end
