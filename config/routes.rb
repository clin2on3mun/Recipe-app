Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "public_recipes#index"

  resources :foods, only: [:index, :create, :new, :show, :destory]
  resources :recipes, only: [:index, :create, :show, :destory] do 
    resources :recipe_foods, only: [:new, :create, :destory]
  end
  
  resources :public_recipes, only: [:index]

end
