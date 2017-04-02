require 'import'

module ComicVine
  module FetchCollection
    class TotalCount
      include Import['api_keys']
      include ComicVine::FetchCollection::Base

      def call(resource:, date_added: nil, date_last_updated: nil)
        arguments = prepare_arguments(date_added, date_last_updated)

        ComicVine::Api
          .new(api_keys[0])
          .send(resource, **arguments)
          .number_of_total_results
      end

      private

      def base_arguments
        { field_list: 'id', limit: 1 }
      end

      def prepare_arguments(date_added, date_last_updated)
        super(base_arguments, date_added, date_last_updated)
      end
    end
  end
end
