require 'import'

module ComicVine
  module Rake
    class PrepareElements
      include Import['persistence.rom']

      def call
        loop do
          find_job do |job|
            break unless job
            ComicsScraper['comic_vine.prepare_element_jobs'].call(job: job)
          end
        end
      end

      private

      def find_job
        job = job_repo.find_random(type: 'comic_vine_collection')
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
