class CreateProxyPackages < ActiveRecord::Migration
  def change
    create_table :proxy_packages do |t|
      t.string :name
      t.string :version

      t.timestamps null: false
    end
  end
end
