Rails.application.routes.draw do

  root to:"homes#top"
  get "about" => "homes#about", as: :about
  resources :posts do
    resource :likes, only: [:create,:destroy]
    resource :dislikes, only: [:create,:destroy]
  end
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
