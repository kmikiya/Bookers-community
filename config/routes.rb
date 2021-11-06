Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get "home/about" => "homes#about"

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]

  resources :groups, only: [:index, :new, :show, :edit, :create, :destroy, :update] do
    resource :group_users, only: [:create, :destroy]
  end
end
