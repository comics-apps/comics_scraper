require 'import'

module ComicVine
  module FetchCollection
    class Ids
      include Import['api_keys']
      include ComicVine::FetchCollection::Base

      def call(resource:, offset:, date_added: nil, date_last_updated: nil)
        arguments = prepare_arguments(offset, date_added, date_last_updated)

        ComicVine::Api
          .new(api_keys[:comic_vine])
          .send(resource, **arguments)
          .results
          .map { |element| element['id'] }
      end

      private

      def base_arguments
        { field_list: 'id', limit: 100, sort: 'id:asc' }
      end

      def prepare_arguments(offset, date_added, date_last_updated)
        arguments = { offset: offset, **base_arguments }
        super(arguments, date_added, date_last_updated)
      end
    end
  end
end
