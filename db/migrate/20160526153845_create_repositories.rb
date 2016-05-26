class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.references :user, index: true, foreign_key: true
      t.string :full_name, index: true

      t.timestamps null: false
    end
  end
end
