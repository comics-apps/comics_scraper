RSpec.describe ComicVine::FetchTotalCount do
  describe '#call' do
    context 'without date resource' do
      it 'returns total count' do
        VCR.use_cassette('fetch_total_count') do
          result = ComicsScraper['comic_vine.fetch_total_count'].call(
            resource: 'origins'
          )
          expect(result).to eq(10)
        end
      end
    end

    context 'with added date' do
      before do
        allow_any_instance_of(ComicVine::Collections)
          .to receive(:call).and_return(%i(issues))
      end

      it 'total issue count is bigger than limited issues' do
        total_count = nil
        count = nil

        VCR.use_cassette('fetch_total_count_issues') do
          total_count = ComicsScraper['comic_vine.fetch_total_count'].call(
            resource: :issues
          )
        end

        VCR.use_cassette('fetch_total_count_issues_date_added') do
          count = ComicsScraper['comic_vine.fetch_total_count'].call(
            resource: :issues, date_added: '2017-01-01'
          )
        end

        expect(total_count).to be > count
      end
    end

    context 'without last updated date' do
      before do
        allow_any_instance_of(ComicVine::Collections)
          .to receive(:call).and_return(%i(issues))
      end

      it 'total issue count is bigger than limited issues' do
        total_count = nil
        count = nil

        VCR.use_cassette('fetch_total_count_issues') do
          total_count = ComicsScraper['comic_vine.fetch_total_count'].call(
            resource: :issues
          )
        end

        VCR.use_cassette('fetch_total_count_issues_date_last_updated') do
          count = ComicsScraper['comic_vine.fetch_total_count'].call(
            resource: :issues, date_last_updated: '2017-01-01'
          )
        end

        expect(total_count).to be > count
      end
    end
  end
end
