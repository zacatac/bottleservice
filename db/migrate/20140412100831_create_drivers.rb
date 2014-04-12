class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :stock_cheap
      t.integer :stock_classy
      t.integer :phone

      t.timestamps
    end
  end
end
