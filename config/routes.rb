ZincFitnessApp::Application.routes.draw do





  resources :workouts


  resources :exercise_sets


  resources :exercises


  devise_for :users

  root to: "workouts#index"

end
