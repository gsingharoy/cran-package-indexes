require 'rails_helper'

describe ApiClients::Cran::Base do
  describe '#fetch' do
    it 'raises an error' do
      expect do
        ApiClients::Cran::Base.new.fetch
      end.to raise_error(RuntimeError)
    end
  end
end
