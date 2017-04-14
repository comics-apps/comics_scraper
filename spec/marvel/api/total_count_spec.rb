RSpec.describe Marvel::Api::TotalCount do
  let(:service) do
    ComicsScraper['marvel.api.total_count']
  end

  describe '#call' do
    context 'without date resource' do
      it 'returns total count' do
        VCR.use_cassette('marvel_fetch_total_count') do
          result = service.call(
            resource: :events
          )
          expect(result).to eq(75)
        end
      end
    end

    context 'without modifiedSince date' do
      it 'total comics count is bigger than limited comics' do
        total_count = nil
        count = nil

        VCR.use_cassette('marvel_fetch_total_count_comics') do
          total_count = service.call(
            resource: :comics
          )
        end

        label = 'marvel_fetch_total_count_comics_date_modified_since'
        VCR.use_cassette(label) do
          count = service.call(
            resource: :comics, modified: '2017-01-01'
          )
        end

        expect(total_count).to be > count
      end
    end
  end
end
