RSpec.describe GcdIssueRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { GcdCoverRepo }
  let(:relation) { :gcd_covers }

  include_examples 'test db connection'
end
