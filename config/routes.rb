Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :books, only: [:create, :index, :show, :edit, :destroy]
  resources :user, only: [:index, :show, :edit, :update]
end
