require 'import'

module ComicVine
  module FetchCollection
    module Base
      def prepare_arguments(arguments, date_added, date_last_updated)
        if date_added
          { **arguments, **date_added_filter(date_added) }
        elsif date_last_updated
          { **arguments, **date_last_updated_filter(date_last_updated) }
        else
          arguments
        end
      end

      def date_added_filter(date)
        filter_hash(:date_added, date)
      end

      def date_last_updated_filter(date)
        filter_hash(:date_last_updated, date)
      end

      def filter_hash(label, date)
        { filter: "#{label}:#{date}|#{today}" }
      end

      def today
        Date.today.strftime('%Y-%m-%d')
      end
    end
  end
end
