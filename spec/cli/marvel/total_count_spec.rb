RSpec.describe Cli::Marvel::TotalCount do
  let(:service) do
    ComicsScraper['cli.marvel.total_count']
  end

  let(:output_text) do
    "characters: 1485\n" \
    "comics: 39323\n" \
    "creators: 6104\n" \
    "events: 75\n" \
    "series: 9267\n" \
    "stories: 87567\n" \
  end

  describe '#call' do
    it 'display counts for all collections' do
      VCR.use_cassette('marvel_total_counts') do
        expect do
          service.call
        end.to output(output_text).to_stdout
      end
    end
  end
end
