require 'spec_helper'

describe User do
  describe 'validations' do
    it 'is invalid without name/email/password_hash' do
      user = User.new
      expect(user).to_not be_valid
    end
    it 'is invalid without a unique email' do
      User.create(name: "Millicent", email: "millie@email.com", password_hash: "cats")
      user2 = User.new(name: "Millicent", email: "millie@email.com", password_hash: "cats")
      expect(user2).to_not be_valid
    end
  end

  describe 'password encryption' do
    it 'has an encrypted password in the database' do
      user = User.create(name: "Millicent", email: "millie@email.com", password: "cats")
      expect(user.password).to_not eq user.password_hash
    end
  end

  describe 'authentication' do
    let!(:bob) { User.create(name: "bob", email: "bob@fish.com", password: "ham")}
    it 'returns the authenticated user if authentication is succssful' do
      expect(User.authenticate("bob@fish.com", "ham")).to eq bob
    end
    it 'returns nil if authentication is unsuccessful' do
      expect(User.authenticate("bob@ham.com", "ham")).to eq nil
    end
  end
end
