class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_login
      t.string :cache_key

      t.timestamps null: false
    end
    add_index :users, :github_login
  end
end
