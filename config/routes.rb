Rails.application.routes.draw do
  get 'about' => 'pages#about', as: 'about'
  get 'opportunities' => 'pages#opportunities', as: 'opportunities'

  root 'pages#index', as: 'home'

  get 'join' => 'users#new'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
