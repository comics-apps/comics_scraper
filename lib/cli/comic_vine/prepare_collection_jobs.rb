require 'import'

module Cli
  module ComicVine
    class PrepareCollectionJobs
      include Import['comic_vine.collections',
                     'shared.prepare_collection_jobs']

      alias prepare_jobs prepare_collection_jobs

      def call(date: nil)
        collections.call.each do |resource|
          arguments = { type: :comic_vine, resource: resource }

          if date
            prepare_jobs.call(**arguments, date: date, field: :added)
            prepare_jobs.call(**arguments, date: date, field: :updated)
          else
            prepare_jobs.call(**arguments)
          end
        end
      end
    end
  end
end
