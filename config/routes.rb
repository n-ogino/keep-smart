Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "charts#new"
  
  resources :users, only: [:new, :create] do
    collection do  
      get "login" => "users#login_form"
      post "login" => "users#login"
      post "logout" => "users#logout"
    end
  end

  resources :charts, only: [:new, :create, :index] 

end
