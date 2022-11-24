Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  resources :menus
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root "menu#index"
resources :menus do
    resources :comments
  end
  # Definroot "menu#index"es the root path route ("/")
  # root "articles#index"
end
