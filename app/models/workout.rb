class Workout < ActiveRecord::Base

  attr_accessible :description, :due_date, :user_id, :exercise_sets_attributes
  belongs_to :user
  has_many :exercise_sets
  has_many :exercises, through: :exercise_sets

  accepts_nested_attributes_for :exercise_sets, allow_destroy: true

  amoeba do
    enable
    clone [:exercise_sets]

  end


end
