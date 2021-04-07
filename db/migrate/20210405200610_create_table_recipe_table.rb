class CreateTableRecipeTable < ActiveRecord::Migration[6.1]
  def change
    create_table :table_recipe_tables do |t|
      t.string :ingredients
      t.string :time
      t.string :name
      t.string :description
      t.string :difficulty_level
      t.integer :servings

      t.timestamps
    end
  end
end
