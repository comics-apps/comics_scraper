require 'import'

module Cli
  module Marvel
    class PrepareCollectionJobs
      include Import['marvel.collections',
                     'shared.prepare_collection_jobs']

      alias prepare_jobs prepare_collection_jobs

      def call(date: nil)
        collections.call.each do |resource|
          arguments = { type: :marvel, resource: resource }

          if date
            prepare_jobs.call(**arguments, date: date, field: :modified)
          else
            prepare_jobs.call(**arguments)
          end
        end
      end
    end
  end
end
