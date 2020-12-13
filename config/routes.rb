Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  root to: "users#index"
  resources :users 
  resources :mypages do
    resources :comments
    collection do
      get 'search'
    end
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
