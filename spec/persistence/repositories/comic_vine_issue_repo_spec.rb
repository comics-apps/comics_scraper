RSpec.describe ComicVineIssueRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineIssueRepo }
  let(:relation) { :comic_vine_issues }

  include_examples 'test db connection'
end
