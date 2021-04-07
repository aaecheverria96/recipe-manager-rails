class CreateTableIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :table_ingredients do |t|
      t.string :name

      t.timestamps
    end
  end
end
