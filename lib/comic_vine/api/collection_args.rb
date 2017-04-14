require 'import'

module ComicVine
  class Api
    class CollectionArgs
      def call(added: nil, updated: nil)
        if added
          filter_hash(label: :date_added, date: added)
        elsif updated
          filter_hash(label: :date_last_updated, date: updated)
        else
          {}
        end
      end

      private

      def filter_hash(label:, date:)
        { filter: "#{label}:#{date}|#{today}" }
      end

      def today
        Date.today.strftime('%Y-%m-%d')
      end
    end
  end
end
