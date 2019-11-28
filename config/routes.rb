Rails.application.routes.draw do
  devise_for :users
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      # get 'step3'
      # get 'step4' # ここで、入力の全てが終了する
      get 'done'
    end
  end
  
  root 'items#index'

  resources :items, only: :new  

  resources :users, only: :show do
    collection do
      get :profile, :credit, :identification
    end
  end

  
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
