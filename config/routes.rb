Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as:'about'
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'followings' => 'relationships#followings', as: 'followings'
  end
  resources :books do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  get '/search' => 'seaches#search', as:'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
