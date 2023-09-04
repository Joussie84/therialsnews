Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
# config/routes.rb

resources :publications do
  resources :comments, only: [:create] do
    get 'destroy', on: :member
  end
end


  get 'homes/index'
  
  root "homes#index"
end

