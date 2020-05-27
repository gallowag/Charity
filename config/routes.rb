Rails.application.routes.draw do
  get 'about' => 'pages#about', as: 'about'
  get 'opportunities' => 'pages#opportunities', as: 'opportunities'

  root 'pages#index', as: 'home'

  get 'signup' => 'users#new'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
