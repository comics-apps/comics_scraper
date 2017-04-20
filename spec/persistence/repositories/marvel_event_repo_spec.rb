RSpec.describe MarvelEventRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { MarvelEventRepo }
  let(:relation) { :marvel_events }

  include_examples 'test db connection'
end
