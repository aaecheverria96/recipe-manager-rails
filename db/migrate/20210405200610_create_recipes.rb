class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
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
