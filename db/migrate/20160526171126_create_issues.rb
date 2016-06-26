class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :repository, index: true, foreign_key: true
      t.integer :pull_id
      t.boolean :closed

      t.timestamps null: false
    end
  end
end
