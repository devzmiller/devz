require 'spec_helper'

describe 'SessionsController' do
  describe 'login form: /sessions/new' do
    it 'returns 200 status' do
      get '/sessions/new'
      expect(last_response).to be_ok
    end
  end

  describe 'login: post /sessions' do
    let!(:user) { User.create!(name: "Hamilton Hamstein", email: "ham@ham.com", password: "ham")}
    it 'returns a 302 +- 1 status' do
      post '/sessions', {email: "ham@ham.com", password: "ham"}
      expect(last_response.redirect?).to be true
    end
    it 'redirects to /users/:id' do
      post '/sessions', {email: "ham@ham.com", password: "ham"}
      expect(last_response.location).to end_with("/users/#{user.id}")
    end
    it 'if username or password is invalid, displays login page again' do
      post '/sessions', {email: "bob@ham.com", password: "ham"}
      expect(last_response.status).to eq 200
    end
  end

  describe 'logout: delete /sessions/:id' do
    let!(:user) { User.create!(name: "Hamilton Hamstein", email: "ham@ham.com", password: "ham")}
    it 'returns a 302 +-1 status' do
      delete "/sessions/#{user.id}", {}, "rack.session" => {user_id: "#{user.id}"}
      expect(last_response.status).to be_within(1).of(302)
    end
    it 'redirects to the /poems page' do
      delete "/sessions/#{user.id}", {}, "rack.session" => {user_id: "#{user.id}"}
      expect(last_response.location).to end_with "/poems"
    end
  end
end
