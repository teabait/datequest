require 'spec_helper'

feature "user visit anothers' profile" do
  scenario "Signed in and goes to another user's page" do
    remy = FactoryGirl.create(:user)
    lady = FactoryGirl.create(:user)

    visit user_path(lady.id)
    expect(current_path).to eq user_path(lady.id)
  end
end

