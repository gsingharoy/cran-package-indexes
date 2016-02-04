class Person < ActiveRecord::Base
  has_many :authors
  has_many :maintainers

  def self.create_from_str(str)
    create(hash_from_str(str))
  end

  def self.hash_from_str(str)
    email = str.match(/\<.*\>/).try(:to_s)
    name = email.present? ? str.gsub("#{email}",'').strip : str.strip
    {
      name: name,
      email: email ? email.gsub(/\<|\>/,'') : nil
    }
  end
end
