RSpec.describe Shared::ElementJobAttributes do
  let(:service) do
    ComicsScraper['shared.element_job_attributes']
  end

  describe '#call' do
    let(:output_data) do
      {
        type: 'foo',
        priority: 1,
        settings: {
          id: 123,
          resource: 'bar'
        }
      }
    end

    it 'returns hash' do
      result = service.call(
        type: 'foo', resource: 'bar', id: 123
      )
      expect(result).to eq(output_data)
    end
  end
end
