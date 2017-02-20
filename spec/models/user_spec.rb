require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save a user if all fields set' do
      @user = User.create(first_name: 'Steven', last_name: 'Bamford', email: "sbamford22@gmail.com", password: "abcd", password_confirmation: "abcd")
      expect(@user.save).to be true
    end

    it 'should show correct error message if first_name is not set' do
      @user = User.create(first_name: nil, last_name: 'Bamford', email: "sbamford22@gmail.com", password: "abcd", password_confirmation: "abcd")
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end

    it 'should show correct error message if last_name is not set' do
      @user = User.create(first_name: 'Steven', last_name: nil, email: "sbamford22@gmail.com", password: "abcd", password_confirmation: "abcd")
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end

    it 'should show correct error message if password is not set' do
      @user = User.create(first_name: 'Steven', last_name: 'Bamford', email: nil, password: "abcd", password_confirmation: "abcd")
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end

  end
end
