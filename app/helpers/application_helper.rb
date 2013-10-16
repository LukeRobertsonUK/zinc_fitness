module ApplicationHelper
   def list_exercises(workout)


    array = workout.exercise_sets.map { |set| "#{set.exercise.name} (#{pluralize(set.sets, 'set')}) " }.join(", ")
  end

  def maximums(grouped_exercises)
    array_of_maximums = []
    grouped_exercises.each do |key, value|
      array_of_maximums << "#{key} #{value}kg"
    end
    array_of_maximums.join(';  ')

  end

  def exercise_set_heading(set)
    unless set.reps.blank?
      heading = "#{set.exercise.name}: #{pluralize(set.sets, 'set')} of #{pluralize(set.reps, 'rep')} / #{pluralize(set.rest_period, 'second')} rest"
    end
    unless set.distance.blank?
      heading = "#{set.exercise.name}: #{pluralize(set.sets, 'set')} of #{pluralize(set.distance, 'metre')} / #{pluralize(set.rest_period, 'second')} rest"
    end
    unless set.time.blank?
      heading = "#{set.exercise.name}: #{pluralize(set.sets, 'set')} of #{pluralize(set.time, 'second')} / #{pluralize(set.rest_period, 'second')} rest"
    end
    if (set.time.blank? && set.reps.blank? && set.distance.blank?)
      heading = "#{set.exercise.name}: #{pluralize(set.sets, 'set')} / #{pluralize(set.rest_period, 'second')} rest"
    end
    heading
  end

def weights_list(set)
  array = []
  set.set_records.each {|record| array << record.weight }
  array.map {|item| "#{item}kg"}.join(', ')
end


end

