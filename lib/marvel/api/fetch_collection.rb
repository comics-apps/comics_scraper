require 'import'

module Marvel
  class Api
    class FetchCollection
      include Import['api_keys', 'marvel.api.order_by_value']

      def call(resource:, limit:, offset:, modified: nil)
        arguments = {
          limit: limit,
          offset: offset,
          modifiedSince: modified,
          orderBy: order_by_value.call(resource: resource)
        }.reject { |_, value| value.nil? }

        Marvel::Api
          .new(public_key, private_key)
          .send(resource, **arguments)
          .results
      end

      private

      def public_key
        api_keys[:marvel][:public_key]
      end

      def private_key
        api_keys[:marvel][:private_key]
      end
    end
  end
end
