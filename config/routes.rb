Rails.application.routes.draw do

  resources :signup do
    collection do
      get 'social_choice'
      get 'user_registration'
      get 'sms_confirmation'
      get 'address'
      # get 'step5' # ここで、入力の全てが終了する
      get 'complete'
      get 'logout'
    end
  end

  delete '/logout', to: 'signup#destroy'


  devise_for :users
  root 'items#index'

  resources :items, only: [:new, :create]

  resources :users, only: [:show] do
    collection do
      get :profile, :credit, :identification
    end
  end

end
