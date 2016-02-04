module ApiClients
  module Cran
    class Base

      BASE_URI = 'http://cran.r-project.org/src/contrib'

      def fetch
        HTTParty.get("#{BASE_URI}/#{fetch_uri}")
      end

      protected

      def fetch_uri
        fail('implement me :)')
      end
    end
  end
end