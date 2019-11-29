Rails.application.routes.draw do

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      # get 'step3'
      # get 'step4' # ここで、入力の全てが終了する
      get 'done'
      get 'logout'
    end
  end

  delete '/logout', to: 'signup#destroy'

  devise_for :users
  root 'items#index'

  resources :items, only: :new  

  resources :users, only: :show do
    collection do
      get :profile, :credit, :identification
    end
  end

end
