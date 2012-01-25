class ActivityAddCompleted < ActiveRecord::Migration
  def change
    add_column :activities, :completed, :boolean, :default => false
  end
end
