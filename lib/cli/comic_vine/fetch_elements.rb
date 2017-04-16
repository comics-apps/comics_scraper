require 'import'

module Cli
  module ComicVine
    class FetchElements
      include Import['comic_vine.api.fetch_resource',
                     'comic_vine.repo_class',
                     'persistence.rom']

      def call
        repo = JobRepo.new(rom)

        loop do
          job = find_job(repo: repo)
          break unless job

          fetch_and_save(job: job)
          repo.delete_single(id: job.id)
        end
      end

      private

      def find_job(repo:)
        repo.find_random(type: 'comic_vine_element')
      end

      def job_repo
        JobRepo.new(rom)
      end

      def fetch_and_save(job:)
        settings = job.settings
        data = fetch_data(id: settings['id'], resource: settings['resource'])
        return unless data
        data['external_id'] = data.delete('id')
        create_or_update_data(resource: settings['resource'], data: data)
      end

      def fetch_data(id:, resource:)
        sleep(1)
        data = make_call(id: id, resource: resource)
        return data if data && !data.empty?

        data = {}
        field_list(resource: resource).each do |field|
          sleep(1)
          part_data = make_call(id: id, resource: resource, field: field)
          data[field] = part_data[field] unless part_data.empty?
        end
        data
      end

      def field_list(resource:)
        YAML.load_file("config/comic_vine_#{resource}_fields.yml")
      end

      def make_call(id:, resource:, field_list: nil)
        fetch_resource.call(id: id, resource: resource, field_list: field_list)
      rescue => e
        puts e
        field_list ? {} : nil
      end

      def create_or_update_data(resource:, data:)
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
