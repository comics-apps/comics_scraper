require 'import'

module ComicVine
  class FetchResource
    include Import['api_keys']

    def call(id:, resource:, **arguments)
      ComicVine::Api
        .new(api_keys[0])
        .send(resource, id, **arguments)
        .results
    end
  end
end
