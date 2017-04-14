RSpec.describe Marvel::Api::OrderByValue do
  let(:service) do
    ComicsScraper['marvel.api.order_by_value']
  end

  describe '#call' do
    context 'with characters resource' do
      it 'returns correct order fields' do
        expect(service.call(resource: :characters))
          .to eq('modified,name')
      end
    end

    context 'with comics resource' do
      it 'returns correct order fields' do
        expect(service.call(resource: :comics))
          .to eq('modified,title,issueNumber')
      end
    end

    context 'with creators resource' do
      it 'returns correct order fields' do
        expect(service.call(resource: :creators))
          .to eq('modified,lastName,firstName')
      end
    end

    context 'with events resource' do
      it 'returns correct order fields' do
        expect(service.call(resource: :events))
          .to eq('modified,name')
      end
    end

    context 'with series resource' do
      it 'returns correct order fields' do
        expect(service.call(resource: :series))
          .to eq('modified,title')
      end
    end

    context 'with stories resource' do
      it 'returns correct order fields' do
        expect(service.call(resource: :stories))
          .to eq('modified,id')
      end
    end
  end
end
