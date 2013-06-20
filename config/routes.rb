Phoga::Engine.routes.draw do
  constraints scheme: Rails.env.production? ? 'https' : 'http' do
    root to: 'dashboard#show'
    resources :articles
  end
end
