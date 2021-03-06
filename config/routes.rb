Rails.application.routes.draw do
  get 'ratings/create'

  root 'static_pages#home'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :stories 
  resources :pages do
    member do
      get :add_choices
    end
  end
  resources :users, only: [:show]
  resources :choices, only: [:create]
  resources :ratings, only: [:create]
end
