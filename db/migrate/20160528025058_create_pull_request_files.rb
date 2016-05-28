class CreatePullRequestFiles < ActiveRecord::Migration
  def change
    create_table :pull_request_files do |t|
      t.string :repository
      t.integer :pull_id
      t.string :file_path

      t.timestamps null: false
    end
    add_index :pull_request_files, :repository
    add_index :pull_request_files, :pull_id
    add_index :pull_request_files, :file_path
  end
end
