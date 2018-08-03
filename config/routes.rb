Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  root 'tops#index'

  resources :coments do
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
