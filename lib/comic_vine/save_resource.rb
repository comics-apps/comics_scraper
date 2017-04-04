require 'import'

module ComicVine
  class SaveResource
    include Import['comic_vine.fetch_resource',
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
      fetch_resource.call(id: id, resource: resource)
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
