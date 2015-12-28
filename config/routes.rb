Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'registrations'}

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/register' => 'devise/registrations#new'
    get '/profile/edit' => 'devise/registrations#edit'
  end

  root to: 'home#index'

  get '/banned' => 'banned#index'

  get '/tos' => 'home#tos'

  get '/profile/edit' => 'profile#edit'
  get '/profile/:id' => 'profile#show'

  post '/report/:id/new' => 'reports#new'
  post 'reports/ignore' => 'reports#ignore'
  post '/reports/ban' => 'reports#ban'
  get '/reports/view' => 'reports#view'



end
