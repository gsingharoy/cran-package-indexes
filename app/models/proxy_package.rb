require 'dcf'

class ProxyPackage < ActiveRecord::Base

  DUMPS_PATH = Rails.root.join('tmp', 'dumps')

  def sync!
    unless package_version_exists?
      dump_tar_file
      unzip_tar_file
      create_package_version
      delete_files
    end
  end

  def package_version_exists?
    PackageVersion.joins(:package)
      .where(packages: { name: name }, package_versions: { version: version })
      .present?
  end

  private

  def create_package_version
    Package.transaction do
      @package_version = PackageVersion.new(version: self.version,
        description: package_description['Description'],
        date_of_publication: package_description['Date/Publication'].to_date
        )
      @package_version.package = package
      @package_version.maintainers << package_maintainers
      @package_version.authors << package_authors
      @package_version.save
    end
  end

  def package_authors
    package_author_names.map do |pan|
      pan_h = Person.hash_from_str(pan)
      existing_person = package_maintainers.select do |m|
        m.person.name == pan_h[:name]
      end.try(:first)
      if existing_person
        person_id = existing_person.id
      else
        person_id = Person.create(pan_h).id
      end
      Author.new(person_id: person_id)
    end
  end

  def package_author_names
    string_with_and_to_array(package_description['Author']).map do |r|
      r.strip
    end
  end

  def package
    @package ||= Package.find_by(name: self.name) ||
      Package.new(name: self.name, title: package_description['Title'])
  end

  def tar_string
    @tar_string ||= ApiClients::Cran::PackageVersion.new(
      version: self.version,
      name: self.name
    ).fetch.body
  end

  def dump_tar_file
    open("#{Rails.root}/tmp/dumps/#{file_name}.tar.gz", 'wb') do |file|
      file.write tar_string
    end
  end

  def unzip_tar_file
    `cd #{DUMPS_PATH} && mkdir D_#{file_name}`
    `cd #{DUMPS_PATH} && tar zxvf #{file_name}.tar.gz -C D_#{file_name}`
  end

  def read_from_description_file
    desc_contents = File.read("#{Rails.root}/tmp/dumps/D_#{file_name}/#{name}/DESCRIPTION")
    Dcf.parse(desc_contents)[0]
  end


  def package_description
    @package_description ||= read_from_description_file
  end

  def file_name
    "#{self.name}_#{self.version}"
  end

  #TODO: implement this
  def delete_files
  end

  def package_maintainers
    string_with_and_to_array(package_description['Maintainer']).map do |str_pm|
      email = str_pm.match(/\<.*\>/).to_s.gsub(/\<|\>/, '')
      person = Person.find_by(email: email) || Person.create_from_str(str_pm)
      Maintainer.new(person_id: person.id)
    end
  end

  def string_with_and_to_array(str)
    result = str.split(',')
    if result[-1].match(/and/)
      result[-1] = result[-1].split('and')[0]
      result += result[-1].split('and')[1]
    end
    result.map{ |r| r.strip }
  end
end
