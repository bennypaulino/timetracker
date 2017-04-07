require 'rails_helper'

describe 'account creation' do
  it 'allows user to create account' do
    visit root_path
    click_link 'Create Account'

    # fill_in 'Name', with: 'Indiana'
    # fill_in 'Email', with: 'indy@jones.com'
    # fill_in 'Password', with: 'templeofdoom'
    # fill_in 'Password Confirmation', with: 'templeofdoom'
    fill_in 'Subdomain', with: 'test_subdomain'
    click_button 'Create Account'

    expect(page).to have_content('Signed up successfully')
  end
end
