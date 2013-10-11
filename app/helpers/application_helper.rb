module ApplicationHelper
   def list_exercises(workout)
    workout.exercise_sets.map {|set| set.exercise.name}.uniq.join(", ")
  end

  def maximums(grouped_exercises)
    array_of_maximums = []
    grouped_exercises.each do |key, value|
      array_of_maximums << "#{key} #{value}kg"
    end
    array_of_maximums.join(';  ')

  end

  def exercise_set_heading(set)
      if set.rest_period.blank?
        "#{set.exercise.name}: #{pluralize(set.reps, 'rep')}"
      else
        "#{set.exercise.name}: #{pluralize(set.reps, 'rep')} / #{pluralize(set.rest_period, 'sec')} rest"
      end
  end


end

