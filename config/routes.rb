Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "public_recipes#index"
  
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :foods, only: [:index, :create, :new, :show, :destroy]
  resources :recipes, except: :edit do 
    resources :recipe_foods, only: [:new, :create, :destroy]
    member do
      patch 'toggle_public'
    end
  end
  
  resources :public_recipes, only: [:index]

end
