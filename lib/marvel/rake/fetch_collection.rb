require 'import'

module Marvel
  module Rake
    class FetchCollection
      include Import['base.split_array_to_half',
                     'marvel.fetch_collection',
                     'persistence.rom']

      def call
        loop do
          find_job do |job|
            break unless job
            fetch_and_save_from_job(job)
            remove_job(job)
          end
        end
      end

      private

      def remove_job(job)
        JobRepo.new(rom).delete_single(id: job.id)
      end

      def fetch_and_save_from_job(job)
        fetch_and_save(
          resource: job.settings['collection'],
          limit: 100,
          offset: job.settings['offset'],
          modified_since: job.settings['modified_since']
        )
      end

      def find_job
        job = job_repo.find_random(type: 'marvel_collection')
        return yield unless job
        p job
        yield(job)
        job
      end

      def job_repo
        JobRepo.new(rom)
      end

      def fetch_and_save(resource:, limit:, offset:, modified_since:)
        results = fetch_collection.call(
          resource: resource, limit: limit, offset: offset,
          modified_since: modified_since
        )
        results.each do |data|
          create_or_update_data(resource, data)
        end
      rescue => e
        handle_exception(e: e, offset: offset, limit: limit, resource: resource,
                         modified_since: modified_since)
      end

      def handle_exception(e:, offset:, limit:, resource:, modified_since:)
        puts e
        return if limit == 1

        left, right = split_array_to_half.call(offset: offset, limit: limit)
        fetch_and_save(resource: resource, limit: left.size, offset: left[0],
                       modified_since: modified_since)
        fetch_and_save(resource: resource, limit: right.size, offset: right[0],
                       modified_since: modified_since)
      end

      def create_or_update_data(resource, data)
        data['external_id'] = data.delete('id')
        repo_class = resource_repo_class(resource)
        repo = repo_class.new(rom)
        document = repo.first_by_external_id(data['external_id'])
        if document
          update_data(repo, document, data)
        else
          create_data(repo, data)
        end
      end

      def create_data(repo, data)
        repo.create(data)
      end

      def update_data(repo, doc, data)
        repo.update(doc._id, data)
      end

      def resource_repo_class(resource)
        {
          characters: ::MarvelCharacterRepo,
          comics: ::MarvelComicRepo,
          creators: ::MarvelCreatorRepo,
          events: ::MarvelEventRepo,
          series: ::MarvelSerieRepo,
          stories: ::MarvelStoryRepo
        }[resource.to_sym]
      end
    end
  end
end
