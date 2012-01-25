class ActivityAddCompleted < ActiveRecord::Migration
  def change
    add_column :activities, :completed, :boolean
  end
end
