RSpec.shared_examples 'match resource' do
  it 'returns correct association' do
    result = service.call(resource: input_resource)
    expect(result).to eql(output_result)
  end
end
