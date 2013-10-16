class ExerciseSet < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :workout
  has_many :set_records
  before_destroy :destroy_set_records
  attr_accessible :achieved_weight, :reps, :rest_period, :suggested_weight, :weight_required, :exercise_id, :workout_id, :set_type, :distance, :time, :notes, :sets, :set_records_attributes
  accepts_nested_attributes_for :set_records, allow_destroy: true


  default_scope order('created_at' )

  validates :exercise_id, presence: true

  def destroy_set_records
    SetRecord.where(exercise_set_id: self.id).each {|record| record.destroy}
  end

end
