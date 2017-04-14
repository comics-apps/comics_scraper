RSpec.describe ComicVine::Api::FetchResource do
  let(:service) do
    ComicsScraper['comic_vine.api.fetch_resource']
  end

  describe '#call' do
    it 'returns single resource' do
      VCR.use_cassette('comicvine_fetch_resource') do
        result = service.call(
          id: 1, resource: :origin, field_list: 'id'
        )
        expect(result).to be_a(Hash)
      end
    end
  end
end
