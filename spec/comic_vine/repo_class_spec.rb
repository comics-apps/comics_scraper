RSpec.describe ComicVine::RepoClass do
  let(:service) do
    ComicsScraper['comic_vine.repo_class']
  end

  describe '#call' do
    context 'with character resource' do
      let(:input_resource) { :character }
      let(:output_result) { ::ComicVineCharacterRepo }

      include_examples 'match resource'
    end

    context 'with concept resource' do
      let(:input_resource) { :concept }
      let(:output_result) { ::ComicVineConceptRepo }

      include_examples 'match resource'
    end

    context 'with episode resource' do
      let(:input_resource) { :episode }
      let(:output_result) { ::ComicVineEpisodeRepo }

      include_examples 'match resource'
    end

    context 'with issue resource' do
      let(:input_resource) { :issue }
      let(:output_result) { ::ComicVineIssueRepo }

      include_examples 'match resource'
    end

    context 'with location resource' do
      let(:input_resource) { :location }
      let(:output_result) { ::ComicVineLocationRepo }

      include_examples 'match resource'
    end

    context 'with movie resource' do
      let(:input_resource) { :movie }
      let(:output_result) { ::ComicVineMovieRepo }

      include_examples 'match resource'
    end

    context 'with object resource' do
      let(:input_resource) { :object }
      let(:output_result) { ::ComicVineObjectRepo }

      include_examples 'match resource'
    end

    context 'with origin resource' do
      let(:input_resource) { :origin }
      let(:output_result) { ::ComicVineOriginRepo }

      include_examples 'match resource'
    end

    context 'with person resource' do
      let(:input_resource) { :person }
      let(:output_result) { ::ComicVinePersonRepo }

      include_examples 'match resource'
    end

    context 'with power resource' do
      let(:input_resource) { :power }
      let(:output_result) { ::ComicVinePowerRepo }

      include_examples 'match resource'
    end

    context 'with publisher resource' do
      let(:input_resource) { :publisher }
      let(:output_result) { ::ComicVinePublisherRepo }

      include_examples 'match resource'
    end

    context 'with series resource' do
      let(:input_resource) { :series }
      let(:output_result) { ::ComicVineShowRepo }

      include_examples 'match resource'
    end

    context 'with story_arc resource' do
      let(:input_resource) { :story_arc }
      let(:output_result) { ::ComicVineStoryArcRepo }

      include_examples 'match resource'
    end

    context 'with team resource' do
      let(:input_resource) { :team }
      let(:output_result) { ::ComicVineTeamRepo }

      include_examples 'match resource'
    end

    context 'with volume resource' do
      let(:input_resource) { :volume }
      let(:output_result) { ::ComicVineVolumeRepo }

      include_examples 'match resource'
    end
  end
end
