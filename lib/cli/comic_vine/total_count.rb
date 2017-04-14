require 'import'

module Cli
  module ComicVine
    class TotalCount
      include Import['comic_vine.collections',
                     'comic_vine.fetch_collection.total_count',
                     'persistence.rom']

      def call
        collections.call.each do |collection_name|
          count = total_count.call(resource: collection_name)
          puts "#{collection_name}: #{count}"
        end
      end
    end
  end
end
