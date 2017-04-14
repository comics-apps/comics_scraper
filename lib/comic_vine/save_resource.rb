require 'yaml'

require 'import'

module ComicVine
  class SaveResource
    include Import['comic_vine.api.fetch_resource',
                   'persistence.rom']

    def call(job:)
      settings = job.settings
      data = fetch_data(id: settings['id'], resource: settings['resource'])
      return unless data
      data['external_id'] = data.delete('id')
      create_or_update_data(settings['resource'], data)
      JobRepo.new(rom).delete_single(id: job.id)
    end

    def fetch_data(id:, resource:)
      sleep(1)
      data = make_call(id, resource)
      return data if data && !data.empty?

      data = {}
      field_list(resource).each do |field|
        sleep(1)
        part_data = make_call(id, resource, field)
        data[field] = part_data[field] unless part_data.empty?
      end
      data
    end

    def field_list(resource)
      YAML.load_file("config/comic_vine_#{resource}_fields.yml")
    end

    def make_call(id, resource, field_list = nil)
      fetch_resource.call(id: id, resource: resource, field_list: field_list)
    rescue => e
      puts e
      field_list ? {} : nil
    end

    def create_or_update_data(resource, data)
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
        character: ::ComicVineCharacterRepo, concept: ::ComicVineConceptRepo,
        episode: ::ComicVineEpisodeRepo,     issue: ::ComicVineIssueRepo,
        location: ::ComicVineLocationRepo,   movie: ::ComicVineMovieRepo,
        object: ::ComicVineObjectRepo,       origin: ::ComicVineOriginRepo,
        person: ::ComicVinePersonRepo,       power: ::ComicVinePowerRepo,
        publisher: ::ComicVinePublisherRepo, series: ::ComicVineShowRepo,
        story_arc: ::ComicVineStoryArcRepo,  team: ::ComicVineTeamRepo,
        volume: ::ComicVineVolumeRepo
      }[resource.to_sym]
    end
  end
end
