RSpec.describe ComicVine::FetchCollection::Ids do
  let(:action) do
    ComicsScraper['comic_vine.fetch_collection.ids']
  end

  describe '#call' do
    context 'without date resource' do
      it 'returns ids' do
        VCR.use_cassette('fetch_ids') do
          result = action.call(
            offset: 0, resource: :origins
          )
          expect(result).to match_array((1..10).to_a)
        end
      end
    end

    context 'with added date' do
      it 'returns ids' do
        VCR.use_cassette('fetch_ids_date_added') do
          result = action.call(
            offset: 0, resource: :origins, date_added: '2017-01-01'
          )
          expect(result).to be_an(Array)
        end
      end
    end

    context 'without last updated date' do
      it 'returns ids' do
        VCR.use_cassette('fetch_ids_date_last_updated') do
          result = action.call(
            offset: 0, resource: :origins, date_last_updated: '2017-01-01'
          )
          expect(result).to be_an(Array)
        end
      end
    end
  end
end
