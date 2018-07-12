Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  root 'tops#index'
  resources :coments do
    collection do
      post :confirm
    end
  end
end
