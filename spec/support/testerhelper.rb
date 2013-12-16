module TestHelper
  def sign_up
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
  end

  def sign_in
    visit root_path
    click_link "login"
    within "form" do
      fill_in 'Email', with: 'remy@remy.com'
      fill_in 'Password', with:'secret'
      click_button 'Login'
    end
  end

  def fill_quest_form
    within "form" do
      fill_in 'Location', with: "a bar"
      fill_in 'quest_description', with: "cuddle"
      click_button "Send"
    end
  end
end
