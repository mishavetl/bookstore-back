Rails.application.routes.draw do
  default_url_options :host => "localhost"
  devise_for :users, controllers: {
      registrations: 'registrations'}
end
