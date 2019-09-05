class RenameTitreColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :limit, :expiration
  end
end
