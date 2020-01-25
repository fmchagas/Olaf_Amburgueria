class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.references :tipe_product, foreign_key: true

      t.timestamps
    end
  end
end
