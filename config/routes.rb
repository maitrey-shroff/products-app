Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to:"products#home"

  get "/products", to:"products#index"

  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"

  get "/add_product", to:"products#add_product"
  post "/save_product", to:"products#save_product"

  delete "/products/:id/", to:"products#destroy"

  get "/products/:id", to:"products#show"

  post "/search", to:"products#search"

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post "/carted_products" => 'carted_products#create'

  get "/orders/show", to:"orders#show"
  post "/orders/create", to:"orders#create"

  get "/carted_products", to:"carted_products#checkout"

end