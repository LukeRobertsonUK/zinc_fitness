class AddFieldToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :instructions, :text

  end
end
