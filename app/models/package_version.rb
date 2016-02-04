class PackageVersion < ActiveRecord::Base
  belongs_to :package
  has_many :authors
  has_many :maintainers
end
