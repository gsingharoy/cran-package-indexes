require 'rails_helper'

describe ApiClients::Cran::Packages do

  describe '#fetch' do
    it 'should make a call to the appropiate API' do
      expect(HTTParty).to receive(:get)
        .with('http://cran.r-project.org/src/contrib/PACKAGES')
        .and_return(true)
      ApiClients::Cran::Packages.new.fetch
    end
  end
end