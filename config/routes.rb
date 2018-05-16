Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
 

  get "/search" => "students#search"
  get "/add_teacher" => "teachers#add_teacher"
  get "/teachers_index" => "teachers#index"
  post "/teachers_index" => "teachers#teacher_created"

  get "/add_student" => "students#add_student"
  # get "/students_index" => "students#index"
  post "/students_index" => "students#student_created"
  root to: "home#index"
end
