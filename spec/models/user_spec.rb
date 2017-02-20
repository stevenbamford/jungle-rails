require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save a user if all fields set' do
      @user = User.create(first_name: 'Steven', last_name: 'Bamford', email: "sbamford22@gmail.com", password: "password", password_confirmation: "password")
      expect(@user.save).to be true
    end

    it 'should not save a user if password and password_confirmation do not match' do
      @user = User.create(first_name: 'Steven', last_name: 'Bamford', email: "sbamford22@gmail.com", password: "password", password_confirmation: "abc")
      expect(@user.save).to be false
    end

    it 'should not save a user if email has already been taken' do
      @user1 = User.create(first_name: 'Steven', last_name: 'Bamford', email: "sbamford22@gmail.com", password: "password", password_confirmation: "password")
      @user2 = User.create(first_name: 'John', last_name: 'Doe', email: "SBAMFORD22@GMAIL.COM", password: "defghijk", password_confirmation: "defghijk")
      expect(@user2.save).to be false
    end

    it 'should not save a user if password is less than 8 characters' do
      @user1 = User.create(first_name: 'Steven', last_name: 'Bamford', email: "sbamford22@gmail.com", password: "abcd", password_confirmation: "abcd")
      expect(@user1.save).to be false
    end

    it 'should show correct error message if first_name is not set' do
      @user = User.create(first_name: nil, last_name: 'Bamford', email: "sbamford22@gmail.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end

    it 'should show correct error message if last_name is not set' do
      @user = User.create(first_name: 'Steven', last_name: nil, email: "sbamford22@gmail.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end

    it 'should show correct error message if password is not set' do
      @user = User.create(first_name: 'Steven', last_name: 'Bamford', email: nil, password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return an instance of a user if authentication is successful' do
      @user = User.create(first_name: 'Steven', last_name: 'Bamford', email: "sbamford22@gmail.com", password: "password", password_confirmation: "password")
      expect(User.authenticate_with_credentials("sbamford22@gmail.com", "password")).to eq(User.find_by_email("sbamford22@gmail.com"))
    end

    it 'should return nil if authentication fails' do
      @user = User.create(first_name: 'Steven', last_name: 'Bamford', email: "sbamford22@gmail.com", password: "password", password_confirmation: "password")
      expect(User.authenticate_with_credentials("sbamford22@gmail.com", "abcdefgh")).to eq(nil)

    end
  end
end
