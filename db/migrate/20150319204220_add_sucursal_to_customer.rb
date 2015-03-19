class AddSucursalToCustomer < ActiveRecord::Migration
  def change
  	create_table :sucursales do |t|
		t.integer :customer_id
		t.string :address
	end
  end
end
