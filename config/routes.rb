Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'history', to: 'history#show'
  resources :shops
  
  get 'topics/index'
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  #’topics/show/:id’へのアクセスは、tpicsコントローラのshowメソッドが受け取る。
  #３行目みたいなgetto構文じゃダメなのかな？
  
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete
end