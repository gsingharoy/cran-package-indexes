require 'dcf'

namespace :packages do
  desc 'syncs the packages from the CRAN server'
  task sync: :environment do
    #TODO: encapsulate this logic in a service
    p_response = ApiClients::Cran::Packages.new.fetch
    if p_response.code == 200
      total = 0
      Dcf.parse(p_response.body).each do |package_hash|
        #TODO: can be encapsulated in a Factory method for ProxyPackage
        proxy_package = ProxyPackage.create(name: package_hash['Package'],
          version: package_hash['Version'])
        total += 1
      end
      puts "synced #{total} package(s)."
    else
      puts 'some error happened'
    end
  end
end