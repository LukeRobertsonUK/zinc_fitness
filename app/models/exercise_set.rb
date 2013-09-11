class ExerciseSet < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :workout
  attr_accessible :achieved_weight, :reps, :rest_period, :suggested_weight, :weight_required, :exercise_id, :workout_id
end
