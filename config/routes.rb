Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :items, only: :new  

  resources :users, only: :show do
    collection do
      get :profile, :credit, :identification
    end
  end

end
