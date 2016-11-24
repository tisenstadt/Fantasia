Rails.application.routes.draw do
  get 'choices_controller/create'

  get 'users/show' => 'users#show'

  root 'static_pages#home'
  devise_for :users
  resources :stories 
  resources :pages do
    member do
      get :add_choices
    end
  end
  resources :users, only: [:show]
  resources :choices, only: [:create]
  

  
end
