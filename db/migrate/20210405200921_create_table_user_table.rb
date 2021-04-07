class CreateTableUserTable < ActiveRecord::Migration[6.1]
  def change
    create_table :table_user_tables do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
