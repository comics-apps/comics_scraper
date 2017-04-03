RSpec.describe ComicVineTeamRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }

  it 'test query' do
    repo = ComicVineTeamRepo.new(rom)
    result = repo.comic_vine_teams.limit(1).to_a

    expect(result).to be_a(Array)
    expect(result.size).to eq(1)
  end
end
