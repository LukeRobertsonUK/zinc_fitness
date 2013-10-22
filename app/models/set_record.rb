class SetRecord < ActiveRecord::Base
  attr_accessible :weight, :exercise_set_id
  belongs_to :exercise_set
  default_scope order('id ASC')
end
