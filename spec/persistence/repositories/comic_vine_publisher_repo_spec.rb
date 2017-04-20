RSpec.describe ComicVinePublisherRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVinePublisherRepo }
  let(:relation) { :comic_vine_publishers }

  include_examples 'test db connection'
end
