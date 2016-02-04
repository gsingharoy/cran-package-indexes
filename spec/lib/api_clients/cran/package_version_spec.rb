require 'rails_helper'

describe ApiClients::Cran::Packages do

  describe '#fetch' do
    it 'should make a call to the appropiate API' do
      expect(HTTParty).to receive(:get)
        .with("http://cran.r-project.org/src/contrib/somename_1.1.1.tar.gz")
        .and_return(true)
      ApiClients::Cran::PackageVersion.new(name: 'somename', version: '1.1.1').fetch
    end
  end
end