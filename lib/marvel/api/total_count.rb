require 'import'

module Marvel
  class Api
    class TotalCount
      include Import['api_keys']

      def call(resource:, modified: nil)
        arguments = { modifiedSince: modified, **base_args }
                    .reject { |_, value| value.nil? }

        Marvel::Api
          .new(public_key, private_key)
          .send(resource, **arguments)
          .total
      end

      private

      def public_key
        api_keys[:marvel][:public_key]
      end

      def private_key
        api_keys[:marvel][:private_key]
      end

      def base_args
        { limit: 1 }
      end
    end
  end
end
