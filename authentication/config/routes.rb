Rails.application.routes.draw do
  root 'public#index'
  get 'login' , to:"session#new"
  get 'logout', to: 'session#destroy'
  get 'register' , to:"user#new"
  resources :user , only:[:create]

  resources :session , only:[:create]

end
