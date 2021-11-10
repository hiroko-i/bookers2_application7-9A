Rails.application.routes.draw do

  get 'rooms/create'
  get 'rooms/show'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as:'about'
  get '/search' => 'searches#search'
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'followings' => 'relationships#followings', as: 'followings'
  end
  resources :books do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  resources :messages, only:[:create]
  resources :rooms, only:[:create,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
