Rails.application.routes.draw do
  root 'tops#index'
  resources :coments do
    collection do
      post :confirm
    end
  end
end
