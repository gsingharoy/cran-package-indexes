class Person < ActiveRecord::Base
  has_many :authors
  has_many :maintainers
end
