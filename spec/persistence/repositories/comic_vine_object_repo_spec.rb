RSpec.describe ComicVineObjectRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineObjectRepo }
  let(:relation) { :comic_vine_objects }

  include_examples 'test db connection'
end
