class CreatePackageVersions < ActiveRecord::Migration
  def change
    create_table :package_versions do |t|
      t.integer :package_id
      t.string :version
      t.date :date_of_publication
      t.text :description

      t.timestamps null: false
    end

    add_index :package_versions, :package_id
    add_index :package_versions, :version
  end
end
