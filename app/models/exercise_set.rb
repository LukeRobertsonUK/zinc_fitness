class ExerciseSet < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :workout
  attr_accessible :achieved_weight, :reps, :rest_period, :suggested_weight, :weight_required, :exercise_id, :workout_id, :set_type, :distance, :time, :notes

  default_scope order('created_at' )

  def to_string
    case set_type
    when "Resistance" then "#{self.exercise.name}: #{self.reps} reps"
    when "Time Interval" then  "#{self.exercise.name}: #{self.time} secs"
    when "Distance" then  "#{self.exercise.name}: #{self.distance} metres"

    end

  end



end
