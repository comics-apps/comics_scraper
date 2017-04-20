RSpec.describe ComicVineStoryArcRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineStoryArcRepo }
  let(:relation) { :comic_vine_story_arcs }

  include_examples 'test db connection'
end
