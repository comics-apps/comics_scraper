RSpec.describe ComicVine::FetchTotalCount do
  describe '#call' do
    context 'with origins resource' do
      it 'returns total count' do
        VCR.use_cassette('fetch_total_count') do
          result = ComicsScraper['comic_vine.fetch_total_count'].call(
            api_key: ENV['COMIC_VINE_API_KEY'], resource: 'origins'
          )
          expect(result).to eq(10)
        end
      end
    end
  end
end
