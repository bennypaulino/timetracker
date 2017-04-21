require 'rails_helper'
# require 'spec_helper'

describe 'account creation' do
  let(:subdomain) { FactoryGirl.generate(:subdomain) }
  before(:each) { sign_up(subdomain) }

  it 'allows user to create account' do
    expect(page.current_url).to include(subdomain)
    expect(Account.all.count).to eq(1)
  end

  it 'allows access of subdomain' do
    visit root_url(subdomain: subdomain)
    puts page.current_url
    expect(page.current_url).to include(subdomain)
  end

  it 'allows account followup creation' do
    subdomain2 = "#{subdomain}2"
    sign_up(subdomain2)
    expect(page.current_url).to include(subdomain2)
    expect(Account.all.count).to eq(2)
  end

  it 'does not allow account creation on subdomain' do
    user = User.first
    subdomain = Account.first.subdomain
    sign_in_user(user, subdomain: subdomain)
    expect { visit new_account_url(subdomain: subdomain) }.to raise_error ActionController::RoutingError
  end

  def sign_up(subdomain)
    visit root_url(subdomain: false)
    click_link 'Create Account'
    # puts page.html

    fill_in 'account_owner_attributes_username', with: 'Indy'
    fill_in 'account_owner_attributes_email', with: 'indiana@jones.com'
    fill_in 'account_owner_attributes_password', with: 'templeofdoom'
    fill_in 'account_owner_attributes_password_confirmation', with: 'templeofdoom'
    fill_in 'Subdomain', with: subdomain
    click_button 'Create Account'
  end
end
