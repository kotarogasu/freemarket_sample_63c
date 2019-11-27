Rails.application.routes.draw do

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      # get 'step3'
      # get 'step4' # ここで、入力の全てが終了する
      get 'done'
    end
  end

  devise_for :users
  root 'items#index'
end
