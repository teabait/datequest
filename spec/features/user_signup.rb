require 'spec_helper'

feature "user sign up" do
  scenario "Sign up with all necessary fields" do
    visit root_path
    click_link "sign up"
    within "form" do
      fill_in 'Username', with: 'remy'
      fill_in 'Email', with: 'remy@remy.com'
      find('#user_birthdate_1i').find(:xpath, 'option[2]').select_option
      fill_in 'Location', with: 'Oakland'
      fill_in 'user_blurb', with: 'puppies puppies'
      fill_in 'user_avatar', with: 'https://pbs.twimg.com/profile_images/3412626470/92e808e43174d24951e995a0aa4cb60a.jpeg'
      fill_in 'Password', with: 'secret'
      fill_in 'Password confirmation', with: 'secret'
      click_button 'Create User'
    end
    expect(current_path).to eq '/'
  end
end
