Rails.application.routes.draw do
  get 'user/login'
  get 'user/register'
  use_doorkeeper
end
