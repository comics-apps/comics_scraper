require 'import'

module ComicVine
  module Rake
    class FetchElements
      include Import['persistence.rom']

      def call
        loop do
          find_job do |job|
            break unless job
            ComicsScraper['comic_vine.save_resource'].call(job: job)
          end
        end
      end

      private

      def find_job
        job = job_repo.find_random(type: 'comic_vine_element')
        return yield unless job
        p job

        yield(job)
      end

      def job_repo
        JobRepo.new(rom)
      end
    end
  end
end
