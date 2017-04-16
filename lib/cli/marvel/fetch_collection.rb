require 'import'

module Cli
  module Marvel
    class FetchCollection
      include Import['marvel.api.fetch_collection',
                     'marvel.repo_class',
                     'persistence.rom',
                     'shared.split_array_to_half']

      def call
        repo = JobRepo.new(rom)

        loop do
          job = find_job(repo: repo)
          break unless job

          fetch_and_save_from_job(job: job)
          repo.delete_single(id: job.id)
        end
      end

      private

      def find_job(repo:)
        repo.find_random(type: 'marvel_collection')
      end

      def job_repo
        JobRepo.new(rom)
      end

      def fetch_and_save_from_job(job:)
        fetch_and_save(
          resource: job.settings['collection'],
          limit: 100,
          offset: job.settings['offset'],
          modified: job.settings['modified']
        )
      end

      def fetch_and_save(resource:, limit:, offset:, modified:)
        results = fetch_collection.call(
          resource: resource, limit: limit, offset: offset,
          modified: modified
        )
        results.each do |data|
          create_or_update_data(resource: resource, data: data)
        end
      rescue => e
        handle_exception(e: e, offset: offset, limit: limit, resource: resource,
                         modified: modified)
      end

      def handle_exception(e:, offset:, limit:, resource:, modified:)
        puts e
        return if limit == 1

        left, right = split_array_to_half.call(offset: offset, limit: limit)
        fetch_and_save(resource: resource, limit: left.size, offset: left[0],
                       modified: modified)
        fetch_and_save(resource: resource, limit: right.size, offset: right[0],
                       modified: modified)
      end

      def create_or_update_data(resource:, data:)
        data['external_id'] = data.delete('id')
        repo = repo_class.call(resource: resource).new(rom)
        doc = repo.first_by_external_id(data['external_id'])
        if doc
          update_data(repo: repo, doc: doc, data: data)
        else
          create_data(repo: repo, data: data)
        end
      end

      def create_data(repo:, data:)
        repo.create(data)
      end

      def update_data(repo:, doc:, data:)
        repo.update(doc._id, data)
      end
    end
  end
end
