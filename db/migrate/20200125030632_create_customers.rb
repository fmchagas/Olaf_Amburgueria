class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :cpf
      t.string :phone
      t.string :email
      t.string :address
      t.string :number
      t.string :district
      t.string :zip
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
