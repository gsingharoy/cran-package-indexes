require 'rails_helper'

describe Package, type: :model do
  it { should have_many :package_versions }
  it { should have_db_index :name }
end
