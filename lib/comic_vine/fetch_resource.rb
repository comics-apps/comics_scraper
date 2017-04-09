require 'import'

module ComicVine
  class FetchResource
    include Import['api_keys']

    def call(id:, resource:, **arguments)
      request = ComicVine::Api
                .new(api_keys[:comic_vine])
                .send(resource, id, **arguments)

      return {} if [500, 502].include?(request.status)
      return {} if request.results.is_a?(Array) && request.results.empty?
      request.results
    end
  end
end
