require 'spec_helper'

feature "user ask out another user" do
  scenario "Signed in and goes to another user's page" do
    remy = FactoryGirl.create(:user)
    lady = FactoryGirl.create(:user)
    visit root_path
    click_link "login"
    within "form" do
      fill_in 'Email', with: remy.email
      fill_in 'Password', with:'secret'
      click_button 'Login'
    visit user_path(lady.id)
    #click_link('ask')
    end
    click_link('ask')
    expect(current_path).to eq new_user_quest_path(lady.id)
  end
end

