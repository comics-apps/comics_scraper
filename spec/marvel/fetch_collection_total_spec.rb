RSpec.describe Marvel::FetchCollectionTotal do
  let(:action) do
    ComicsScraper['marvel.fetch_collection_total']
  end

  describe '#call' do
    context 'without date resource' do
      it 'returns total count' do
        VCR.use_cassette('marvel_fetch_total_count') do
          result = action.call(
            resource: :events
          )
          expect(result).to eq(75)
        end
      end
    end
  end
end
