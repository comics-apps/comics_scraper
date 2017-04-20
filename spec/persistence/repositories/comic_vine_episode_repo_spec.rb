RSpec.describe ComicVineEpisodeRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineEpisodeRepo }
  let(:relation) { :comic_vine_episodes }

  include_examples 'test db connection'
end
