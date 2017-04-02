RSpec.describe ComicVine::FetchCollection::TotalCount do
  let(:action) do
    ComicsScraper['comic_vine.fetch_collection.total_count']
  end

  describe '#call' do
    context 'without date resource' do
      it 'returns total count' do
        VCR.use_cassette('fetch_total_count') do
          result = action.call(
            resource: :origins
          )
          expect(result).to eq(10)
        end
      end
    end

    context 'with added date' do
      it 'total issue count is bigger than limited issues' do
        total_count = nil
        count = nil

        VCR.use_cassette('fetch_total_count_issues') do
          total_count = action.call(
            resource: :issues
          )
        end

        VCR.use_cassette('fetch_total_count_issues_date_added') do
          count = action.call(
            resource: :issues, date_added: '2017-01-01'
          )
        end

        expect(total_count).to be > count
      end
    end

    context 'without last updated date' do
      it 'total issue count is bigger than limited issues' do
        total_count = nil
        count = nil

        VCR.use_cassette('fetch_total_count_issues') do
          total_count = action.call(
            resource: :issues
          )
        end

        VCR.use_cassette('fetch_total_count_issues_date_last_updated') do
          count = action.call(
            resource: :issues, date_last_updated: '2017-01-01'
          )
        end

        expect(total_count).to be > count
      end
    end
  end
end
