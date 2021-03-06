Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'history', to: 'history#show'
  resources :shops
  
  resources :topics
  post 'topics/:id' , to: 'topics#destroy' #10/15「削除できない」ルーティングエラーはこれで解消された。
  resources :posts
  
  get 'signup', to: 'users#new' #見栄え良くしてる
  resources :users
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' #見栄え良くしている
end