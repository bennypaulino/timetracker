class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  constraints(SubdomainPresent) do
    root 'projects#index', as: :subdomain_root
    devise_for :users
    resources :users, only: :index
  end

  # only allow certain routes when there isn't a subdomain
  constraints(SubdomainBlank) do
    root 'welcome#index'
    resources :accounts, only: [:new, :create]
    get '*path' => redirect('/')
  end
end
