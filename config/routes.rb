Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'items#index'

  resources :signup do
    collection do
      get 'social_choice'
      get 'user_registration'
      get 'sms_confirmation'
      get 'address'
      get 'card_new' # ここで、入力の全てが終了する
      get 'card_create', to: 'signup#card_create'
      get 'complete'
      get 'auth/:provider/callback', to: 'sessions#create'
      get 'logout'
    end
  end
# 　# ログアウト用
# devise_scope :user do
#   delete :sign_out, to: 'devise/sessions#destroy', as: :destroy_user_session
# end
  delete '/logout', to: 'signup#destroy'

  resources :items do

    collection do
      get :category_find
      get :brand_find
    end

    member do
      get :show_user_item
      get :image_edit
    end
  end


  resources :users, only: [:show, :create] do
    collection do
      get :mypage
      get :profile
      get :listing
      get :shopping
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

  resources :purchase do
    member do
      get :buy
      get :buy_complete
      get :pay
    end
  end
end

