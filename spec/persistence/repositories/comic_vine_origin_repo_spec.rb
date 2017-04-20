RSpec.describe ComicVineOriginRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineOriginRepo }
  let(:relation) { :comic_vine_origins }

  include_examples 'test db connection'
end
