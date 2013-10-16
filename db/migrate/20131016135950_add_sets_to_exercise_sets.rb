class AddSetsToExerciseSets < ActiveRecord::Migration
  def change
    add_column :exercise_sets, :sets, :integer
  end
end
