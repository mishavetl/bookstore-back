Rails.application.routes.draw do
  resources :categories, only [:index]
  resources :books, only: [:index]
  mount_devise_token_auth_for 'User', at: 'auth'
  default_url_options :host => "localhost"
end
