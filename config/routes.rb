DateQuest::Application.routes.draw do
  resources :users, only: [:new, :create, :show, :index, :edit]
  resource :session, only: [:new, :create, :destroy]
  root to: 'welcome#index'
end
