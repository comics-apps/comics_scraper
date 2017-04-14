require 'import'

module Marvel
  class FetchCollection
    class TotalCount
      include Import['api_keys']

      def call(resource:, modified_since: nil)
        arguments = prepare_arguments(modified_since)
        Marvel::Api
          .new(api_keys[:marvel][:public_key], api_keys[:marvel][:private_key])
          .send(resource, **arguments)
          .total
      end

      private

      def base_arguments
        { limit: 1 }
      end

      def prepare_arguments(modified_since)
        if modified_since
          { **base_arguments, modifiedSince: modified_since }
        else
          base_arguments
        end
      end
    end
  end
end
