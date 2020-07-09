Rails.application.routes.draw do
  get 'about' => 'pages#about', as: 'about'
  get 'opportunities' => 'pages#opportunities', as: 'opportunities'

  root 'pages#index', as: 'home'

  get 'join' => 'users#new'
  get 'designers' => 'users#index'
  get 'profile' => 'users#show', as: 'profile'
  get 'edit' => 'users#edit', as: 'edit'
  patch 'edit' => 'users#update', as: 'update'
  patch 'designer' => 'users#designerify', as: 'designerify'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
