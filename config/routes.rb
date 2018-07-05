Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  default_url_options :host => "localhost"
  # devise_for :users, controllers: {
  #     registrations: 'registrations'}
end
