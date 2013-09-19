module ApplicationHelper
   def list_exercises(workout)
    workout.exercise_sets.map {|set| set.exercise.name}.uniq.join(", ")
  end

end

