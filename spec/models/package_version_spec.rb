require 'rails_helper'

describe PackageVersion, type: :model do
  it { should belong_to :package }
  it { should have_many :authors }
  it { should have_many :maintainers }
  it { should have_db_index :package_id }
end
