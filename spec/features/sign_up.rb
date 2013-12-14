require 'spec_helper'

feature "user signs up" do
  background do
    remy = FactoryGirl.create(:user, username: "remy")
  end
  scenario "Signing in with correct credentials" do
    visit root_path
    click_link "login"
    within "form" do
      fill_in 'Email', :with => 'remy.email'
      fill_in 'Password', :with => 'secret'
      click_button 'Login'
    end
    current_path.should == "/"
  end
end
