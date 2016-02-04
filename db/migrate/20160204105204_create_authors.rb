class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :package_version_id
      t.integer :person_id

      t.timestamps null: false
    end

    add_index :authors, :package_version_id
    add_index :authors, :person_id
  end
end
