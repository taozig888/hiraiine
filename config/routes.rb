Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'history', to: 'history#show'
  resources :shops
  
  resources :topics
  post 'topics/:id' , to: 'topics#destroy' #10/15「削除できない」ルーティングエラーはこれで解消された。
  resources :posts
end