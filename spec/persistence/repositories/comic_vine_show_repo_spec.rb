RSpec.describe ComicVineShowRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineShowRepo }
  let(:relation) { :comic_vine_shows }

  include_examples 'test db connection'
end
