Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  get '/public_recipes', to: 'recipes#public_recipes'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, shallow: true, except: [:edit, :update] do
    resources :ingredients, only: [:new, :create, :destroy, :edit, :update]
    member do
      post 'publish'
    end
  end
  get '/general_shopping_list', to: 'shopping_list#index', as: 'general_shopping_list'
end
