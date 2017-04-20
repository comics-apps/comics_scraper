RSpec.describe GcdIssueRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { GcdIssueRepo }
  let(:relation) { :gcd_issue }

  include_examples 'test db connection'
end
