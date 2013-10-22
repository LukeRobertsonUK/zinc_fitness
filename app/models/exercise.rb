class Exercise < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :exercise_sets
  has_many :workouts, through: :exercise_sets
  has_many :set_records, through: :exercise_sets
  default_scope order('name' )
  validates :name, presence: true
  validates :name, uniqueness: true


end
