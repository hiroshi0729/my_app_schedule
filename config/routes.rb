Rails.application.routes.draw do
  root to: 'tasks#index' # トップページの設定
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
