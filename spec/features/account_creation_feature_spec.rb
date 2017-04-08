require 'rails_helper'

describe 'account creation' do
  it 'allows user to create account' do
    visit root_path
    click_link 'Create Account'
    # puts page.html

    fill_in 'account_owner_attributes_username', with: 'Indy'
    fill_in 'account_owner_attributes_email', with: 'indiana@jones.com'
    fill_in 'account_owner_attributes_password', with: 'templeofdoom'
    fill_in 'account_owner_attributes_password_confirmation', with: 'templeofdoom'
    fill_in 'Subdomain', with: 'test_subdomain'
    click_button 'Create Account'

    expect(page).to have_content('Signed up successfully')
  end
end
