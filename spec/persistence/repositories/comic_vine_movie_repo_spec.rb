RSpec.describe ComicVineMovieRepo do
  let(:rom) { ComicsScraper['persistence.rom'] }
  let(:repo_class) { ComicVineMovieRepo }
  let(:relation) { :comic_vine_movies }

  include_examples 'test db connection'
end
