Rails.application.routes.draw do
  root to: 'top#index'
  get '/auth/twitter/callback', to: 'sessions#create', as: 'callback'
  get '/auth/failure', to: 'sessions#error', as: 'failure'
  get '/profile', to: 'sessions#show', as: 'profile'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :searches, only: [] do
    collection do
      get 'account'
      get 'tweet'
    end
  end

  resources :accounts, only: [:index, :new, :create] do
    collection do
      get 'diff'
    end
  end

end
