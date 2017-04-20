RSpec.describe ComicVineCharacterRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineCharacterRepo }
  let(:relation) { :comic_vine_characters }

  include_examples 'test db connection'
end
