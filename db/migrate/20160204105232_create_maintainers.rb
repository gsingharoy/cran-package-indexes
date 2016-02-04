class CreateMaintainers < ActiveRecord::Migration
  def change
    create_table :maintainers do |t|
      t.integer :package_version_id
      t.integer :person_id

      t.timestamps null: false
    end

    add_index :maintainers, :package_version_id
    add_index :maintainers, :person_id
  end
end
