require 'import'

module Marvel
  class FetchCollection
    include Import['api_keys']

    def call(resource:, limit:, offset:, modified_since: nil)
      puts "#{resource}, offset: #{offset}, limit: #{limit}"
      arguments = prepare_arguments(resource, limit, offset, modified_since)
      Marvel::Api
        .new(public_key, private_key)
        .send(resource, **arguments)
        .results
    end

    private

    def prepare_arguments(resource, limit, offset, modified_since)
      {
        limit: limit,
        offset: offset,
        modifiedSince: modified_since,
        orderBy: order_by(resource)
      }.reject { |_, value| value.nil? }
    end

    def public_key
      api_keys[:marvel][:public_key]
    end

    def private_key
      api_keys[:marvel][:private_key]
    end

    def order_by(resource)
      {
        characters: 'modified,name',
        comics: 'modified,title,issueNumber',
        creators: 'modified,lastName,firstName',
        events: 'modified,name',
        series: 'modified,title',
        stories: 'modified,id'
      }[resource.to_sym]
    end
  end
end
