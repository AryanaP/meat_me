Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :users, only: [ :edit, :update, :show ]
  resources :meals do
    resources :meetings, only: [ :index, :update ]
  end
end
