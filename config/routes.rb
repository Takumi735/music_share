Rails.application.routes.draw do
  root "posts#index"
  get "mypage", to: "mypages#show", as: "mypage"
  get "search", to: "search#index"
  get "tracks/search", to: "tracks#search", as: "search_tracks"

  resources :posts, only: [ :index, :show, :new, :create, :destroy ]

  resources :posts do
    resource :like, only: [ :create, :destroy ]
  end

  devise_for :users
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
end
