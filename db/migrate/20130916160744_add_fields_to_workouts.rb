class AddFieldsToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :completed, :boolean
    add_column :workouts, :completion_date, :datetime
  end
end
