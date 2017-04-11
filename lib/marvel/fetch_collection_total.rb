require 'import'

module Marvel
  class FetchCollectionTotal
    include Import['api_keys']

    def call(resource:)
      Marvel::Api
        .new(api_keys[:marvel][:public_key], api_keys[:marvel][:private_key])
        .send(resource, limit: 1)
        .total
    end
  end
end
