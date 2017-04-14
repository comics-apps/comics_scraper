RSpec.describe ComicVine::Api::TotalCount do
  let(:service) do
    ComicsScraper['comic_vine.api.total_count']
  end

  describe '#call' do
    context 'without date resource' do
      it 'returns total count' do
        VCR.use_cassette('comicvine_fetch_total_count') do
          result = service.call(
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

        VCR.use_cassette('comicvine_fetch_total_count_issues') do
          total_count = service.call(
            resource: :issues
          )
        end

        VCR.use_cassette('comicvine_fetch_total_count_issues_date_added') do
          count = service.call(
            resource: :issues, added: '2017-01-01'
          )
        end

        expect(total_count).to be > count
      end
    end

    context 'without last updated date' do
      it 'total issue count is bigger than limited issues' do
        total_count = nil
        count = nil

        VCR.use_cassette('comicvine_fetch_total_count_issues') do
          total_count = service.call(
            resource: :issues
          )
        end

        label = 'comicvine_fetch_total_count_issues_date_last_updated'
        VCR.use_cassette(label) do
          count = service.call(
            resource: :issues, updated: '2017-01-01'
          )
        end

        expect(total_count).to be > count
      end
    end
  end
end
