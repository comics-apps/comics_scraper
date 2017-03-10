module ComicVine
  class FetchTotalCount
    def call(api_key:, resource:)
      ComicVine::Api
        .new(api_key)
        .send(resource, limit: 1, field_list: 'id')
        .number_of_total_results
    end
  end
end
