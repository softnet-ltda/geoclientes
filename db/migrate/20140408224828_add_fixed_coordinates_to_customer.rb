class AddFixedCoordinatesToCustomer < ActiveRecord::Migration
  def change
	  rename_column :customers, :lat, :latitude
	  rename_column :customers, :lng, :longitude
  end
end
