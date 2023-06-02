class CreateRecipeFood < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.belongs_to :recipes, null: false, foreign_key: true
      t.belongs_to :foods, null: false, foreign_key: true

      t.timestamps
    end
  end
end
