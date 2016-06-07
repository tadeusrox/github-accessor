Rails.application.routes.draw do
  resources :sessions, only: [] do
    collection do
      get 'authorize'
      get 'create'
    end
  end

  resources :users, only: [], path: '' do
    collection do
      get ':name', to: 'users#show', as: :user
    end
  end

  resources :pull_requests, only: [:show] do
  end

  get 'welcome/index'
  root 'welcome#index'
end
