Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :signup do
    collection do
      get 'social_choice'
      get 'user_registration'
      get 'sms_confirmation'
      get 'address'
      get 'card_new' # ここで、入力の全てが終了する
      post 'card_create', to: 'signup#card_create'
      get 'complete'
      get 'logout'
    end
  end

  delete '/logout', to: 'signup#destroy'

  resources :items, only: [:index, :new, :show, :create, :edit, :update] do

    collection do
      get :category_find
      get :brand_find
    end

    member do
      get :show_user_item
    end
  end


  resources :users, only: [:show, :create] do
    collection do
      get :mypage
      get :profile
      get :listing
      get :credit
      get :identification
      post :address
    end

    member do
      post :buy
      get :buy_complete
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
