class ChangeTasksAddLimitTimer < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :limit, :date
  end
  def down
    remove_column :tasks, :limit
  end
end
