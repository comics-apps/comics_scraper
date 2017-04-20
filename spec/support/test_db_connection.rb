RSpec.shared_examples 'test db connection' do
  it 'test query' do
    repo = repo_class.new(rom)
    result = repo.send(relation).limit(1).to_a

    expect(result).to be_a(Array)
  end
end
