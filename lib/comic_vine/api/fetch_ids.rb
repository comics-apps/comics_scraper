require 'import'

module ComicVine
  class Api
    class FetchIds
      include Import['api_keys', 'comic_vine.api.collection_args']

      def call(resource:, offset:, added: nil, updated: nil)
        extra_args = collection_args.call(added: added, updated: updated)
        arguments = { offset: offset, **base_args, **extra_args }

        ComicVine::Api
          .new(api_key)
          .send(resource, **arguments)
          .results
          .map { |element| element['id'] }
      end

      private

      def api_key
        api_keys[:comic_vine]
      end

      def base_args
        { field_list: 'id', limit: 100, sort: 'id:asc' }
      end
    end
  end
end
