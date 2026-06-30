class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :document
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end
end
