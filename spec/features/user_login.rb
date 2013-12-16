require 'spec_helper'

feature "user sign in" do
  scenario "Signing in with correct credentials" do
    remy = FactoryGirl.create(:user)
    visit root_path
    click_link "login"
    within "form" do
      fill_in 'Email', with: remy.email
      fill_in 'Password', with:'secret'
      click_button 'Login'
    end
    expect(current_path).to eq user_path(remy.id)
  end
end

