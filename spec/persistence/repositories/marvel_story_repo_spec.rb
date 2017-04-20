RSpec.describe MarvelStoryRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { MarvelStoryRepo }
  let(:relation) { :marvel_stories }

  include_examples 'test db connection'
end
