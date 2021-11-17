Rails.application.routes.draw do
  get 'profile/edit'
  post 'profile/edit'
  get 'password/forgot'
  post 'password/forgot'
  get 'password/reset'
  post 'password/reset'
  get 'account/signup'
  post 'account/signup'
  get 'account/signin'
  post 'account/signin'
  get 'account/signout'
  get 'home/index'
  get 'home/contact'
  get 'home/about'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
