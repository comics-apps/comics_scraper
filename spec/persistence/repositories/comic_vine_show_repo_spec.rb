RSpec.describe ComicVineShowRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }

  it 'test query' do
    repo = ComicVineShowRepo.new(rom)
    result = repo.comic_vine_shows.limit(1).to_a

    expect(result).to be_a(Array)
    expect(result.size).to eq(1)
  end
end
