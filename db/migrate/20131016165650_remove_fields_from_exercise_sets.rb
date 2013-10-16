class RemoveFieldsFromExerciseSets < ActiveRecord::Migration
  def up
    remove_column :exercise_sets, :set_type
    remove_column :exercise_sets, :weight_required
    remove_column :exercise_sets, :achieved_weight
    remove_column :exercise_sets, :suggested_weight

  end


end
