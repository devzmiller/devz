require 'spec_helper'

describe 'UsersController' do
  describe '/users/new' do
    it 'returns 200 status' do
      get '/users/new'
      expect(last_response.status).to eq 200
    end
  end
end
