Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as:'about'
  resources :users
  resources :books
    resource :favorites,only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
