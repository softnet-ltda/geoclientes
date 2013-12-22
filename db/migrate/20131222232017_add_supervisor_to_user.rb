class AddSupervisorToUser < ActiveRecord::Migration
  def change
    add_column :users, :supervisor_id, :integer
  end
end
