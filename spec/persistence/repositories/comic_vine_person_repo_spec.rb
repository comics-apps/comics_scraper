RSpec.describe ComicVinePersonRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVinePersonRepo }
  let(:relation) { :comic_vine_people }

  include_examples 'test db connection'
end
