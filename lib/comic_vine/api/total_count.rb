require 'import'

module ComicVine
  class Api
    class TotalCount
      include Import['api_keys', 'comic_vine.api.collection_args']

      def call(resource:, added: nil, updated: nil)
        extra_args = collection_args.call(added: added, updated: updated)
        arguments = { **base_args, **extra_args }

        ComicVine::Api
          .new(api_key)
          .send(resource, **arguments)
          .number_of_total_results
      end

      private

      def api_key
        api_keys[:comic_vine]
      end

      def base_args
        { field_list: 'id', limit: 1 }
      end
    end
  end
end
