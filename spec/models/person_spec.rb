require 'rails_helper'

describe Person, type: :model do
  it { should have_db_index :email }
  it { should have_many :authors }
  it { should have_many :maintainers }
end
