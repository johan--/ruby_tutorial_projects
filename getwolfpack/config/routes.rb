Rails.application.routes.draw do
  class SubdomainRequired
    def self.matches?(request)
      request.subdomain.present? && request.subdomain != "www"
    end
  end

  constraints SubdomainRequired do
    root to: 'dashboards#show', as: 'subdomain_root'
  end

  devise_for :users
  root 'welcome#index'

  resource :account, only: [:new, :create]
end
