ZincFitnessApp::Application.routes.draw do







  resources :exercise_sets


  resources :exercises


  devise_for :users

   get '/users', to: "users#index", as: 'users'
  get '/users/:id', to: "users#show", as: 'user'


  resources :workouts do
    member do
      post 'duplicate', to: "workouts#duplicate"
      post 'complete', to: "workouts#complete"
    end
  end

  root to: "passthrough#index"

end
