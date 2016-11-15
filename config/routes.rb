Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to:"products#home"

  get "/products", to:"products#index"

  get "/products/:id", to:"products#show"


end
