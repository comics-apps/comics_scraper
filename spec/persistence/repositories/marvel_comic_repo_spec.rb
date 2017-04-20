RSpec.describe MarvelComicRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { MarvelComicRepo }
  let(:relation) { :marvel_comics }

  include_examples 'test db connection'
end
