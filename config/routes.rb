Rails.application.routes.draw do

  devise_for :user do
  end

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/signup' => 'devise/registrations#new'
  end

  root to: 'home#index'
end
