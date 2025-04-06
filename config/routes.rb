Rails.application.routes.draw do
root "posts#index"

resources :posts, only: [ :index, :show, :new, :create, :destroy ]

get "search/index"

devise_for :users
devise_scope :user do
  get "/users/sign_out" => "devise/sessions#destroy"
  end
end
