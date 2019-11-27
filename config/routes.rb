Rails.application.routes.draw do
  devise_for :users
  resources :items 
  root 'items#index'

  resources :users, only: :show do
    collection do
      get :profile,:credit
    end
  end

end
