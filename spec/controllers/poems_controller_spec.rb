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
      get '/poems/new'
      expect(last_response.location).to end_with "/sessions/new"
    end
  end

  describe 'poem edit page: /poems/:id/edit' do
    let!(:user) { User.create!(name: "Hamilton Hamstein", email: "ham@ham.com", password: "ham")}
    let!(:poem) { Poem.create!(title: "A Poem", body: "Lines of a poem", user: user)}
    it 'returns OK status if user is logged in and owner of poem' do
      get "/poems/#{poem.id}/edit", {}, "rack.session" => {user_id: user.id}
      expect(last_response).to be_ok
    end
    it 'returns redirect if user is logged out' do
      get "/poems/#{poem.id}/edit", {}, "rack.session" => {user_id: 40000}
      expect(last_response.redirect?).to be true
    end
    it 'redirects to login page if user is logged out' do
      get "/poems/#{poem.id}/edit", {}, "rack.session" => {user_id: 40000}
      expect(last_response.location).to end_with "/sessions/new"
    end
  end

  describe 'new poem: post /poems' do
    let!(:user) { User.create!(name: "Hamilton Hamstein", email: "ham@ham.com", password: "ham")}
    it 'returns redirect' do
      post "/poems", {user: user, title: "A Poem", body: "Lines of a poem"}, "rack.session" => {user_id: user.id}
      expect(last_response.redirect?).to be true
    end
    it 'redirect to /poems/:id if user is logged in ' do
      post "/poems", {user: user, title: "A Poem", body: "Lines of a poem"}, "rack.session" => {user_id: user.id}
      poem = Poem.find_by_title("A Poem")
      expect(last_response.location).to end_with "/poems/#{poem.id}"
    end
    it 'returns redirect if user is logged out' do
      post "/poems", {user: user, title: "A Poem", body: "Lines of a poem"}
      expect(last_response.location).to end_with "/sessions/new"
    end
  end
end
