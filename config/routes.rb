Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/students", to: "students#index"
  get "/students/new", to: "students#new"
  post "/students", to: "students#create"
  get "/students/:id", to: "students#show"
  get "/students/:id/edit", to: "students#edit"
  patch "/students/:id", to: "students#update"
  delete "/students/:id", to: "students#destroy"
end
