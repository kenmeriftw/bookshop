Rails.application.routes.draw do
  resources :publishers
  root 'shops#index'

  resources :shops
  resources :books

  namespace :api do
    namespace :v1 do
      resources :shops, only: :index
    end
  end
end
