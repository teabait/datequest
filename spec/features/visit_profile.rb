require 'spec_helper'

feature "user visit anothers' profile" do
  scenario "Signed in and goes to another user's page" do
    remy = FactoryGirl.create(:user)
    lady = FactoryGirl.create(:user)
    # visit root_path
    # click_link "login"
    # within "form" do
    #   fill_in 'Email', with: remy.email
    #   fill_in 'Password', with:'secret'
    #   click_button 'Login'
    sign_in
    visit user_path(lady.id)
    # end
    expect(current_path).to eq user_path(lady.id)
  end
end

