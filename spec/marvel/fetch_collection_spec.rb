RSpec.describe Marvel::FetchCollection do
  let(:action) do
    ComicsScraper['marvel.fetch_collection']
  end

  describe '#call' do
    it 'returns single resource' do
      VCR.use_cassette('marvel_fetch_collection') do
        result = action.call(
          resource: :events, limit: 1, offset: 0
        )
        expect(result).to be_a(Array)
      end
    end
  end
end
