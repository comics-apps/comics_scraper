RSpec.describe MarvelCharacterRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { MarvelCharacterRepo }
  let(:relation) { :marvel_characters }

  include_examples 'test db connection'
end
