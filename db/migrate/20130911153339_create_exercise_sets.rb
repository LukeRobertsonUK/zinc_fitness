class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.references :exercise
      t.integer :reps
      t.integer :rest_period
      t.boolean :weight_required
      t.float :suggested_weight
      t.float :achieved_weight
      t.references :workout

      t.timestamps
    end
    add_index :exercise_sets, :exercise_id
    add_index :exercise_sets, :workout_id
  end
end
