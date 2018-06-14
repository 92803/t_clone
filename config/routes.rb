Rails.application.routes.draw do
  resources :coments do
    collection do
      post :confirm
    end
  end
end
