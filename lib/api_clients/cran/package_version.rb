module ApiClients
  module Cran
    class PackageVersion < Base

      def initialize(attrs = {})
        @name = attrs[:name] || fail('no :name passed')
        @version = attrs[:version] || fail('no :version passed')
      end

      protected

      def fetch_uri
        "#{@name}_#{@version}.tar.gz"
      end
    end
  end
end