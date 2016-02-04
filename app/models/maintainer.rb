class Maintainer < ActiveRecord::Base
  belongs_to :package_version
  belongs_to :person
end
