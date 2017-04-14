require 'import'

module ComicVine
  class Api
    class FetchResource
      include Import['api_keys']

      def call(id:, resource:, **arguments)
        request = ComicVine::Api
                  .new(api_key)
                  .send(resource, id, **arguments)

        return {} if [500, 502].include?(request.status)
        return {} if request.results.is_a?(Array) && request.results.empty?
        request.results
      end

      private

      def api_key
        api_keys[:comic_vine]
      end
    end
  end
end
