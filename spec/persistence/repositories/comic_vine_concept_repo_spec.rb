RSpec.describe ComicVineConceptRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineConceptRepo }
  let(:relation) { :comic_vine_concepts }

  include_examples 'test db connection'
end
