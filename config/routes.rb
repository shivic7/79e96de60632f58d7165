Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/api/users", to: "user#get_all_users"
  get "api/user/:id", to: "user#get_all_users"
  post "/api/user", to: "user#add_user"
  put "/api/user/:id", to: "user#update_user"
  delete "/api/user/:id", to: "user#delete_user"
  get "/api/typeahead/:input", to: "user#typehead"
end
