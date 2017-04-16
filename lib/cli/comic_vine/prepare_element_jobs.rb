require 'import'

module Cli
  module ComicVine
    class PrepareElementJobs
      include Import['comic_vine.api.fetch_ids',
                     'comic_vine.single_resource',
                     'shared.element_job_attributes',
                     'persistence.rom']

      def call
        repo = JobRepo.new(rom)

        loop do
          job = find_job(repo: repo)
          break unless job

          resource_ids(job: job).each do |resource_id|
            repo.create(prepare_attrs(id: resource_id,
                                      resource: job.settings['collection']))
          end

          repo.delete_single(id: job.id)
        end
      end

      private

      def find_job(repo:)
        repo.find_random(type: 'comic_vine_collection')
      end

      def job_repo
        JobRepo.new(rom)
      end

      def resource_ids(job:)
        sleep(1)
        fetch_ids.call(
          resource: job.settings['collection'],
          offset: job.settings['offset'],
          added: job.settings['added'],
          updated: job.settings['updated']
        )
      end

      def prepare_attrs(id:, resource:)
        element_job_attributes.call(
          type: 'comic_vine_element',
          id: id,
          resource: single_resource.call(resource: resource)
        )
      end
    end
  end
end
