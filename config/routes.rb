Rails.application.routes.draw do
  get 'list_item/show'
  get 'list_item/create'
  get 'list_item/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
      post 'login', to: 'users#login'
      post 'signup', to: 'users#signup'
      get 'user/:id', to: 'users#show'
      get 'userlists', to: 'users#show_user_lists'
      
      resources :lists
      post 'createlist', to: 'lists#create'
      get 'list/:id', to: 'lists#show'
      post 'list/:id', to: 'lists#create'
      delete 'list/:id', to: 'lists#destroy'

      resources :list_items
      post 'createlistitem', to: 'list_items#create'
      delete 'listitem/:id', to: 'list_items#destroy'

    end
  end
end
