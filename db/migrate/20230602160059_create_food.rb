class CreateFood < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false, default: ""
      t.string :measurement, null: false, default: ""
      t.decimal :price, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
