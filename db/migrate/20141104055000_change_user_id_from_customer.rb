class ChangeUserIdFromCustomer < ActiveRecord::Migration
  def up
	  rename_column :customers, :user_id, :account
  end

  def down
  end
end
