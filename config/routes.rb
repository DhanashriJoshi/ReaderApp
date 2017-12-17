Rails.application.routes.draw do
  root to: 'feeds#index'

  resources :feeds do
    get 'articles', to: 'articles#index'
  end
  get 'articles', to: 'articles#index'
end
