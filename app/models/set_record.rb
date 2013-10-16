class SetRecord < ActiveRecord::Base
  attr_accessible :weight, :exercise_set_id
  belongs_to :exercise_set
end
