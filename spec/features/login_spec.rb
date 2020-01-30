require 'rails_helper'

RSpec.feature 'User Log In', type: :feature do
  before :each do
    @user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '123456')
  end

  scenario 'Valid Log In' do
    visit new_user_session_path
    fill_in('Email', with: @user.email)
    fill_in('Password', with: @user.password)
    
      click_button('Log in')
    
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'Invalid Log In' do
    visit new_user_session_path
    fill_in('Email', with: 'xxx')
    fill_in('Password', with: @user.password)
    
      click_button('Log in')
    
    expect(page).to have_current_path(new_user_session_path)
  end
end