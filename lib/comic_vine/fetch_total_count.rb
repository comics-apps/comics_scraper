module ComicVine
  class FetchTotalCount
    def call(api_key:, resource:, date_added: nil, date_last_updated: nil)
      arguments = prepare_arguments(date_added, date_last_updated)

      ComicVine::Api
        .new(api_key)
        .send(resource, **arguments)
        .number_of_total_results
    end

    private

    def prepare_arguments(date_added, date_last_updated)
      arguments = { limit: 1, field_list: 'id' }

      if date_added
        arguments_with_date_added_filter(arguments, date_added)
      elsif date_last_updated
        arguments_with_date_last_updated_filter(arguments, date_last_updated)
      else
        arguments
      end
    end

    def arguments_with_date_added_filter(arguments, date)
      today = Date.today
      arguments.merge(
        filter: "date_added:#{date}|#{today.strftime('%Y-%m-%d')}"
      )
    end

    def arguments_with_date_last_updated_filter(arguments, date)
      today = Date.today
      arguments.merge(
        filter: "date_last_updated:#{date}|#{today.strftime('%Y-%m-%d')}"
      )
    end
  end
end
