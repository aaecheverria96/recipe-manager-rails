class CreateTableComment < ActiveRecord::Migration[6.1]
  def change
    create_table :table_comments do |t|
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
