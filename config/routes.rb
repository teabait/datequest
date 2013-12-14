DateQuest::Application.routes.draw do
  resources :users, only: [:new, :create, :show, :index, :edit] do
    resources :quests, only: [:new, :create, :show, :index, :edit]
  end
  resource :session, only: [:new, :create, :destroy]
  root to: 'welcome#index'
end
