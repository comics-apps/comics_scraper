RSpec.describe ComicVine::SingleResource do
  let(:service) do
    ComicsScraper['comic_vine.single_resource']
  end

  describe '#call' do
    context 'with characters resource' do
      let(:input_resource) { :characters }
      let(:output_result) { :character }

      include_examples 'match resource'
    end

    context 'with concepts resource' do
      let(:input_resource) { :concepts }
      let(:output_result) { :concept }

      include_examples 'match resource'
    end

    context 'with episodes resource' do
      let(:input_resource) { :episodes }
      let(:output_result) { :episode }

      include_examples 'match resource'
    end

    context 'with issues resource' do
      let(:input_resource) { :issues }
      let(:output_result) { :issue }

      include_examples 'match resource'
    end

    context 'with locations resource' do
      let(:input_resource) { :locations }
      let(:output_result) { :location }

      include_examples 'match resource'
    end

    context 'with movies resource' do
      let(:input_resource) { :movies }
      let(:output_result) { :movie }

      include_examples 'match resource'
    end

    context 'with objects resource' do
      let(:input_resource) { :objects }
      let(:output_result) { :object }

      include_examples 'match resource'
    end

    context 'with origins resource' do
      let(:input_resource) { :origins }
      let(:output_result) { :origin }

      include_examples 'match resource'
    end

    context 'with people resource' do
      let(:input_resource) { :people }
      let(:output_result) { :person }

      include_examples 'match resource'
    end

    context 'with powers resource' do
      let(:input_resource) { :powers }
      let(:output_result) { :power }

      include_examples 'match resource'
    end

    context 'with publishers resource' do
      let(:input_resource) { :publishers }
      let(:output_result) { :publisher }

      include_examples 'match resource'
    end

    context 'with series_list resource' do
      let(:input_resource) { :series_list }
      let(:output_result) { :series }

      include_examples 'match resource'
    end

    context 'with story_arcs resource' do
      let(:input_resource) { :story_arcs }
      let(:output_result) { :story_arc }

      include_examples 'match resource'
    end

    context 'with teams resource' do
      let(:input_resource) { :teams }
      let(:output_result) { :team }

      include_examples 'match resource'
    end

    context 'with volumes resource' do
      let(:input_resource) { :volumes }
      let(:output_result) { :volume }

      include_examples 'match resource'
    end
  end
end
