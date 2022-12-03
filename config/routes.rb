Rails.application.routes.draw do

  devise_for :users
  root to:"posts#index"
  get "about" => "homes#about", as: :about
  resources :posts do
    resource :likes, only: [:create,:destroy]
    resource :dislikes, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end
  resources :comments  do
    resource :comment_likes, only: [:create, :destroy]
    resource :comment_dislikes, only: [:create, :destroy]
  end
  get '/search', to: 'searches#search'

  resources :favorites, only: [:index]
  resources :bankrolls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
