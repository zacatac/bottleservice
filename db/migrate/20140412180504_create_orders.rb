class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cheap_beer 
      t.integer :class_beer
      t.references :member
      t.timestamps
    end
  end
end
