RSpec.describe Cli::ComicVine::TotalCount do
  let(:service) do
    ComicsScraper['cli.comic_vine.total_count']
  end

  let(:output_text) do
    "characters: 114934\n" \
    "concepts: 1363\n" \
    "episodes: 21951\n" \
    "issues: 541604\n" \
    "locations: 7294\n" \
    "movies: 2064\n" \
    "objects: 3573\n" \
    "origins: 10\n" \
    "people: 43371\n" \
    "powers: 128\n" \
    "publishers: 6280\n" \
    "series_list: 578\n" \
    "story_arcs: 3821\n" \
    "teams: 8207\n" \
    "volumes: 85112\n"
  end

  describe '#call' do
    it 'display counts for all collections' do
      VCR.use_cassette('comic_vine_total_counts') do
        expect do
          service.call
        end.to output(output_text).to_stdout
      end
    end
  end
end
