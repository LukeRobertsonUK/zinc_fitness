class Workout < ActiveRecord::Base

  attr_accessible :description, :due_date, :user_id, :exercise_sets_attributes, :completed, :completion_date
  belongs_to :user
  has_many :exercise_sets
  has_many :exercises, through: :exercise_sets
  before_destroy :destroy_exercise_sets
  accepts_nested_attributes_for :exercise_sets, allow_destroy: true
  default_scope order('created_at DESC' )

  amoeba do
    enable
    clone [:exercise_sets]
    nullify :user_id
    nullify :due_date
    nullify :completed
    nullify :completion_date

  end


  def destroy_exercise_sets
    ExerciseSet.where(workout_id: self.id).each {|set| set.destroy}
  end

  def mark_completed
    (self.completion_date ||= Time.now)

  end



end
