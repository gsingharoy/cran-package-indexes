class Author < ActiveRecord::Base
  belongs_to :person
  belongs_to :package_version
end
