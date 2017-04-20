RSpec.describe ComicVineTeamRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineTeamRepo }
  let(:relation) { :comic_vine_teams }

  include_examples 'test db connection'
end
