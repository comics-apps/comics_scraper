RSpec.describe ComicVinePowerRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVinePowerRepo }
  let(:relation) { :comic_vine_powers }

  include_examples 'test db connection'
end
