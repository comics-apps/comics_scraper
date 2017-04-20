RSpec.describe ComicVineLocationRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineLocationRepo }
  let(:relation) { :comic_vine_locations }

  include_examples 'test db connection'
end
