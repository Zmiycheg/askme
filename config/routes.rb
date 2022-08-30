Rails.application.routes.draw do

  root to: 'questions#index'
  resource :session, only: %i[new create destroy]
  resources :questions
  resources :questions do
    member do
      put :hide
      patch :hide
    end
  end
  resources :users, param: :nickname, except: %i[index]
end
