class CreateSetRecords < ActiveRecord::Migration
  def change
    create_table :set_records do |t|
      t.float :weight
      t.references :exercise_set

      t.timestamps
    end
    add_index :set_records, :exercise_set_id
  end
end
