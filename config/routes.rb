Rails.application.routes.draw do
  devise_for :users
  root "users#top" #ログイン後別ページに飛びたい場合ここを変えれば良さげ！
  resources :users, only: [:edit, :update, :show]
  resources :groups do
    resources :messages, only: [:index, :create]
    member do
      get :join
    end
    member do
      get :mygroup
    end
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:create, :show] do
    resources :directmessages, only: [:create]
  end
end
