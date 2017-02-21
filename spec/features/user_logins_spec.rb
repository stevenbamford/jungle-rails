require 'rails_helper'

RSpec.feature "User can log in to their account", type: :feature, js:true do

  before :each do
    @user = User.create! first_name: "Steven", last_name: "Bamford", email: "sbamford22@gmail.com", password: "password", password_confirmation: "password"
  end

  scenario "User logs in" do
    visit login_path

    within 'form' do
      fill_in id: "email", with: "sbamford22@gmail.com"
      fill_in id: "password", with: "password"
      click_button 'Submit'
    end
    sleep(3)
    save_screenshot
  end
end
