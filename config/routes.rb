Phoga::Engine.routes.draw do
  constraints scheme: Rails.env.production? ? 'https' : 'http' do
    root to: 'dashboard#show'

    resources :articles, except: [:show]

    devise_for :admins, {
      class_name: "Phoga::Admin",
      path: '/',
      controllers: {
        registrations: 'phoga/admins/registrations',
        confirmations: 'phoga/admins/confirmations',
        sessions:      'phoga/admins/sessions',
        passwords:     'phoga/admins/passwords'
      }
    }
  end
end
