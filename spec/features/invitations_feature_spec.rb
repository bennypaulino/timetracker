require 'rails_helper'
require 'spec_helper'

describe 'invitations' do
  let!(:account) { create(:account_with_schema) }
  let(:user) { account.owner }

  it 'shows the owner in the authorized users list' do
    sign_in_user(user, subdomain: account.subdomain)
    visit users_url(subdomain: account.subdomain)
    expect(page).to have_content user.name
    expect(page).to have_selector '.glyphicon-ok'
  end
end
