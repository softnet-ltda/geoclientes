class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :type
      t.integer :status
      t.datetime :date

      t.timestamps
    end
  end
end
