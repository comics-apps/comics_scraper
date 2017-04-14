require 'import'

module Cli
  module Marvel
    class TotalCount
      include Import['marvel.collections',
                     'marvel.api.total_count',
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
