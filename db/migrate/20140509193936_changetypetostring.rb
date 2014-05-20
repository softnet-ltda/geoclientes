class Changetypetostring < ActiveRecord::Migration
  def up
	  rename_column :events, :type, :event_type
	  change_column :events, :event_type, :string
  end

  def down
  end
end
