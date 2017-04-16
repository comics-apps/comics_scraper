RSpec.shared_examples 'single resource' do
  it 'returns correct single resource' do
    result = service.call(resource: collection_resource)
    expect(result).to eql(single_resource)
  end
end
