Dummy::Application.routes.draw do
  mount Phoga::Engine, at: '/admin'
end
