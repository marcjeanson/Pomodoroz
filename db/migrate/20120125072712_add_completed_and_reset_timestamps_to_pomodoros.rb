class AddCompletedAndResetTimestampsToPomodoros < ActiveRecord::Migration
  def change
    add_column :pomodoros, :completed_at, :datetime
    add_column :pomodoros, :reset_at, :datetime
  end
end
