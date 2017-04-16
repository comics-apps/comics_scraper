RSpec.describe ComicVine::SingleResource do
  let(:service) do
    ComicsScraper['comic_vine.single_resource']
  end

  describe '#call' do
    context 'with characters resource' do
      let(:collection_resource) { :characters }
      let(:single_resource) { :character }

      include_examples 'single resource'
    end

    context 'with concepts resource' do
      let(:collection_resource) { :concepts }
      let(:single_resource) { :concept }

      include_examples 'single resource'
    end

    context 'with episodes resource' do
      let(:collection_resource) { :episodes }
      let(:single_resource) { :episode }

      include_examples 'single resource'
    end

    context 'with issues resource' do
      let(:collection_resource) { :issues }
      let(:single_resource) { :issue }

      include_examples 'single resource'
    end

    context 'with locations resource' do
      let(:collection_resource) { :locations }
      let(:single_resource) { :location }

      include_examples 'single resource'
    end

    context 'with movies resource' do
      let(:collection_resource) { :movies }
      let(:single_resource) { :movie }

      include_examples 'single resource'
    end

    context 'with objects resource' do
      let(:collection_resource) { :objects }
      let(:single_resource) { :object }

      include_examples 'single resource'
    end

    context 'with origins resource' do
      let(:collection_resource) { :origins }
      let(:single_resource) { :origin }

      include_examples 'single resource'
    end

    context 'with origins resource' do
      let(:collection_resource) { :people }
      let(:single_resource) { :person }

      include_examples 'single resource'
    end

    context 'with powers resource' do
      let(:collection_resource) { :powers }
      let(:single_resource) { :power }

      include_examples 'single resource'
    end

    context 'with publishers resource' do
      let(:collection_resource) { :publishers }
      let(:single_resource) { :publisher }

      include_examples 'single resource'
    end

    context 'with series_list resource' do
      let(:collection_resource) { :series_list }
      let(:single_resource) { :series }

      include_examples 'single resource'
    end

    context 'with story_arcs resource' do
      let(:collection_resource) { :story_arcs }
      let(:single_resource) { :story_arc }

      include_examples 'single resource'
    end

    context 'with teams resource' do
      let(:collection_resource) { :teams }
      let(:single_resource) { :team }

      include_examples 'single resource'
    end

    context 'with volumes resource' do
      let(:collection_resource) { :volumes }
      let(:single_resource) { :volume }

      include_examples 'single resource'
    end
  end
end
