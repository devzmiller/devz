require 'spec_helper'

describe "PoemsController" do
  describe '/poems/new' do
    it 'returns OK status if user is logged in' do
      get '/poems/new', {}, "rack.session" => {user_id: 1}
      expect(last_response).to be_ok
    end
    it 'returns redirect if user is logged out' do
      get '/poems/new'
      expect(last_response.redirect?).to be true
    end
    it 'redirects to login page if user is logged out' do

    end
  end
end
