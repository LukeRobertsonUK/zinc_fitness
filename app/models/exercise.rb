class Exercise < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :exercise_sets
  has_many :workouts, through: :exercise_sets

  validates :name, presence: true
  validates :name, uniqueness: true


end
