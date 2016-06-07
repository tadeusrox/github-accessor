class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.integer :pull_id
      t.string :repo
      t.boolean :checked
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :pull_requests, :pull_id
  end
end
