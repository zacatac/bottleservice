class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :info_url
      t.decimal :price

      t.timestamps
    end
  end
end