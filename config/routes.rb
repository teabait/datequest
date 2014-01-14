DateQuest::Application.routes.draw do
  resources :users, only: [:new, :create, :show, :index, :edit] do
    resources :quests, only: [:new, :create, :show, :index, :edit, :update]
    resources :messages, only: [:new, :create, :show, :index]
  end
  resource :session, only: [:new, :create, :destroy]
  resource :welcome, only: [:show]
  root to: 'users#new'
end
