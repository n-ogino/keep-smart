Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "charts#home"
  
  resources :users, only: [:new, :create] do
    collection do  
      get "login" => "users#login_form"
      post "login" => "users#login"
      post "logout" => "users#logout"
    end
  end

  resources :charts, only: [:new, :create, :index] do
    collection do
      get "home", to: "charts#home"
    end
  end

  resources :comments, only: [:index, :new, :create, :delete]

end
