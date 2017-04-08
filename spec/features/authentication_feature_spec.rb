require 'rails_helper'

describe 'user authentication'do
  it 'allows signin with valid credentials' do
    sign_in_user(create(:user))
    expect(page).to have_content('Signed in successfully')
  end

  it 'does not allow signin with invalid credentials' do
    sign_in_user(create(:user), password: 'wrong-pw')

    expect(page).to have_content('Invalid Email or password')
  end

  it 'allows user to sign out' do
    sign_in_user(create(:user))

    visit root_path
    click_link 'Log out'
    expect(page).to have_content('Signed out successfully')
  end
end

def sign_in_user(user, opts={})
  visit new_user_session_path
  # fill_in 'account_owner_attributes_email', with: user.email
  # fill_in 'account_owner_attributes_password', with: (opts[:password] || user.password)
  fill_in 'Email', with: user.email
  fill_in 'Password', with: (opts[:password] || user.password)
  click_button 'Log in'
end
