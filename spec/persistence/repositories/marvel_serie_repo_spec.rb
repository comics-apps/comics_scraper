RSpec.describe MarvelSerieRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { MarvelSerieRepo }
  let(:relation) { :marvel_series }

  include_examples 'test db connection'
end
