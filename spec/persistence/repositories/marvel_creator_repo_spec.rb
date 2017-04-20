RSpec.describe MarvelCreatorRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { MarvelCreatorRepo }
  let(:relation) { :marvel_creators }

  include_examples 'test db connection'
end
