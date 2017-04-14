RSpec.describe ComicVine::Api::CollectionArgs do
  let(:service) do
    ComicsScraper['comic_vine.api.collection_args']
  end

  describe '#call' do
    context 'with added argument' do
      it 'returns hash with arguments' do
        expect(service.call(added: '2017-01-01'))
          .to eq(filter: 'date_added:2017-01-01|2017-03-01')
      end
    end

    context 'with updated argument' do
      it 'returns hash with arguments' do
        expect(service.call(updated: '2017-01-01'))
          .to eq(filter: 'date_last_updated:2017-01-01|2017-03-01')
      end
    end

    context 'with nil arguments' do
      it 'returns hash with arguments' do
        expect(service.call(added: nil, updated: nil))
          .to eq({})
      end
    end
  end
end
