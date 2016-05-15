Rails.application.routes.draw do
  resources :sessions, only: [] do
    collection do
      get 'authorize'
      get 'create'
    end
  end


  get '/login/oauth/authorize', host: 'https://github.com:80', as: :oauth_authorize


  get 'welcome/index'
  root 'welcome#index'
end
