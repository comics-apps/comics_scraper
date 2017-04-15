RSpec.describe Shared::CollectionJobAttributesWithDate do
  let(:service) do
    ComicsScraper['shared.collection_job_attributes_with_date']
  end

  describe '#call' do
    let(:output_data) do
      {
        type: 'foo',
        priority: 0,
        settings: {
          collection: 'bar',
          offset: 12_300,
          added: '2000-01-01'
        }
      }
    end

    it 'returns hash' do
      result = service.call(
        type: 'foo', resource: 'bar', page: 123, date: '2000-01-01',
        field: :added
      )
      expect(result).to eq(output_data)
    end
  end
end
