class AddFieldToExerciseSets < ActiveRecord::Migration
  def change
    add_column :exercise_sets, :notes, :string


  end
end
