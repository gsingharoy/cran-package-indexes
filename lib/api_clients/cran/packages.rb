module ApiClients
  module Cran
    class Packages < Base

      protected

      def fetch_uri
        'PACKAGES'
      end
    end
  end
end