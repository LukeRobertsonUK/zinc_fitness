ZincFitnessApp::Application.routes.draw do





  resources :workouts do
    member do
      post 'duplicate', to: "workouts#duplicate"
      get 'complete', to: "workouts#complete"
    end
  end


  resources :exercise_sets


  resources :exercises


  devise_for :users

  root to: "workouts#index"

end
