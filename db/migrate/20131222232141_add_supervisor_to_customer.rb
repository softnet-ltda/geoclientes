class AddSupervisorToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :supervisor_id, :integer
  end
end
