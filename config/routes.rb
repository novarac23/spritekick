Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :spritekicks do
    member do
      post '/upvote', to: "spritekicks#upvote"
      post '/downvote', to: "spritekicks#downvote"
    end
  end
  get 'latest', to: "spritekicks#latest"
  get 'oldest', to: "spritekicks#oldest"
  get 'search', to: "spritekicks#search"

  root 'spritekicks#index'
end
