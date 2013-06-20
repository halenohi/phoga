Phoga::Engine.routes.draw do
  constraints scheme: Rails.env.production? ? 'https' : 'http' do
    root to: 'dashboard#show'

    resources :articles

    devise_for :users, {
      class_name: "Phoga::User",
      module: :devise,
      controllers: {
        registrations: 'phoga/users/registrations',
        confirmations: 'phoga/users/confirmations',
        sessions:      'phoga/users/sessions',
        passwords:     'phoga/users/passwords'
      }
    }
  end
end
