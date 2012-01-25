class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.integer :activity_id, :null => false

      t.timestamps
    end
  end
end
