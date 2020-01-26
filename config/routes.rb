Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  get 'users' => 'users#like'
  get 'users/:id' => 'users#show'
  # get 'posts' => 'posts#index'
  # get 'posts/new' => 'posts#new'
  # post 'posts' => 'posts#create'
  # get "posts/:id" => "posts#show"
  # get "posts/:id/edit" => "posts#edit"
  # post "posts/:id/update" => "posts#update"
  # post "posts/:id/destroy" => "posts#destroy"
end
