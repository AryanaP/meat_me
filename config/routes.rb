Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :edit, :update, :show ] do
    resources :reviews, only: [ :new, :create ]
  end
  resources :meals do
    resources :meetings, only: [ :create, :index, :update ]
  end

end
