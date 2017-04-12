require 'rails_helper'

describe 'user authentication'do
  let(:user) { build(:user) }
  let!(:account) { create(:account_with_schema, owner: user) }

  it 'allows signin with valid credentials' do
    sign_in_user(user, subdomain: account.subdomain)
    expect(page).to have_content('Signed in successfully')
  end

  it 'does not allow signin with invalid credentials' do
    sign_in_user(user, subdomain: account.subdomain, password: 'wrong-pw')

    expect(page).to have_content('Invalid Email or password')
  end

  it "doesn't allow user to signin unless on subdomain" do
    expect { visit new_user_session_path }.to raise_error ActionController::RoutingError
  end

  it 'does not allow user from one subdomain to sign in on another subdomain' do
    user2 = build(:user)
    account2 = create(:account_with_schema, owner: user2)

    sign_in_user(user2, subdomain: account2.subdomain)
    expect(page).to have_content('Signed in successfully')

    sign_in_user(user2, subdomain: account.subdomain)
    expect(page).to have_content('Invalid Email or password')
  end

  it 'allows user to sign out' do
    sign_in_user(user, subdomain: account.subdomain)

    click_link 'Log out'
    expect(page).to have_content('Signed out successfully')
  end
end

def sign_in_user(user, opts={})
  # visit new_user_session_path
  visit new_user_session_url(subdomain: opts[:subdomain])
  fill_in 'Email', with: user.email
  fill_in 'Password', with: (opts[:password] || user.password)
  click_button 'Log in'
end
