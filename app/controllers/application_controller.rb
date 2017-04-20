class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :load_schema, :authenticate_user!

  private

  def load_schema
    Apartment::Tenant.switch!('public')
    return unless request.subdomain.present?

    account = Account.find_by(subdomain: request.subdomain)
    # if current_account
    if account
      # Apartment::Tenant.switch!(current_account.subdomain)
      Apartment::Tenant.switch!(account.subdomain)
    else
      redirect_to root_url(subdomain: :false)
    end
  end

  # def current_account
  #   @current_account ||= Account.find_by(subdomain: request.subdomain)
  # end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
