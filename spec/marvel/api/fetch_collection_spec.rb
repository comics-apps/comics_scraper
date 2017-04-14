RSpec.describe Marvel::Api::FetchCollection do
  let(:service) do
    ComicsScraper['marvel.api.fetch_collection']
  end

  describe '#call' do
    it 'returns single resource' do
      VCR.use_cassette('marvel_fetch_collection') do
        result = service.call(
          resource: :events, limit: 1, offset: 0
        )
        expect(result).to be_a(Array)
      end
    end
  end
end
