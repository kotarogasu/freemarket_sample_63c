Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      # get 'step5' # ここで、入力の全てが終了する
      get 'done'
      get 'logout'
    end
  end

  delete '/logout', to: 'signup#destroy'

  resources :items, only: [:new, :create]

  resources :users, only: [:show, :create] do
    collection do
      get :profile
      get :credit
      get :identification
      post :address
    end
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
      get 'mypage_new', to: 'card#mypage_new'
      get 'addition', to: 'card#addition'
    end
  end
end
