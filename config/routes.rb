Rails.application.routes.draw do

  root to: 'questions#index'
  resource :session, only: %i[new create destroy]
  resources :questions
  resources :users, only: %i[new create update edit destroy]

end
