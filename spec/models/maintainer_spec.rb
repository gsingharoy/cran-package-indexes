require 'rails_helper'

describe Maintainer, type: :model do
  it { should belong_to :person }
  it { should have_db_index :person_id }
  it { should belong_to :package_version }
  it { should have_db_index :package_version_id }
end
