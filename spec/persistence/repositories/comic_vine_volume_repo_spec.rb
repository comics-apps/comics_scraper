RSpec.describe ComicVineVolumeRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineVolumeRepo }
  let(:relation) { :comic_vine_volumes }

  include_examples 'test db connection'
end
