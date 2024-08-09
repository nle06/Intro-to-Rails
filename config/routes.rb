Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: 'pages#about'

  resources :breeds, only: [:index, :show] do
    resources :images, only: [:show, :index]
  end

  resources :images, only: [:index, :show] # Add this line
end
