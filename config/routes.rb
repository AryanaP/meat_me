Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  devise_for :users
  resources :users, only: [ :edit, :update, :show ]
  resources :meals

end
