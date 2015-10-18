Rails.application.routes.draw do

  devise_for :user do
  end

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/register' => 'devise/registrations#new'
  end

  root to: 'home#index'
  get '/tos' => 'home#tos'

  get '/profile/:id' => 'profile#show'


end
