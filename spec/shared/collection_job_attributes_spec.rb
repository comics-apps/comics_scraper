RSpec.describe Shared::CollectionJobAttributes do
  let(:service) do
    ComicsScraper['shared.collection_job_attributes']
  end

  describe '#call' do
    let(:output_data) do
      {
        type: 'foo',
        priority: 0,
        settings: {
          collection: 'bar',
          offset: 12_300
        }
      }
    end

    it 'returns hash' do
      result = service.call(
        type: 'foo', resource: 'bar', page: 123
      )
      expect(result).to eq(output_data)
    end
  end
end
