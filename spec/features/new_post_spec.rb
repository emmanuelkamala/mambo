require 'rails_helper'

RSpec.feature 'User Creates New Post', type: :feature do
  before :each do
    @user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '123456')
    login_path @user
  end

  scenario 'Valid Post' do
    visit '/posts/new'
    fill_in :content, with: 'Hello World', visible: false
    click_button 'Create a post'
    expect(page).to have_current_path(posts_path)
  end

  scenario 'Invalid Post(content length)' do
    visit '/posts'
    click_button 'Submit'
    expect(page).to have_current_path(new_post_path)
  end
end