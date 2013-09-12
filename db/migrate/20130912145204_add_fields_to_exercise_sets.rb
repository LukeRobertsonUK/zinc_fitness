class AddFieldsToExerciseSets < ActiveRecord::Migration
  def change
        add_column :exercise_sets, :set_type, :string
        add_column :exercise_sets, :distance, :integer
        add_column :exercise_sets, :time, :integer



  end
end
