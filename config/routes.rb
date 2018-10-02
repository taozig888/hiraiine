Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'history', to: 'history#show'
end