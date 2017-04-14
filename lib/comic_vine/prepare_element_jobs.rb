require 'import'

module ComicVine
  class PrepareElementJobs
    include Import['comic_vine.api.fetch_ids',
                   'persistence.rom']

    def call(job:)
      job_repo = JobRepo.new(rom)

      resource_ids(job).each do |resource_id|
        job_repo.create(job_attributes(resource_id, job))
      end

      job_repo.delete_single(id: job.id)
    end

    private

    def resource_ids(job)
      sleep(1)
      fetch_ids.call(
        resource: job.settings['collection'],
        offset: job.settings['offset'],
        added: job.settings['added'],
        updated: job.settings['updated']
      )
    end

    def job_attributes(id, job)
      {
        type: 'comic_vine_element',
        priority: 1,
        settings: {
          id: id,
          resource: element_resource(job.settings['collection'])
        }
      }
    end

    def element_resource(collection)
      {
        characters: :character, concepts: :concept,
        episodes: :episode,     issues: :issue,
        locations: :location,   movies: :movie,
        objects: :object,       origins: :origin,
        people: :person,        powers: :power,
        publishers: :publisher, series_list: :series,
        story_arcs: :story_arc, teams: :team,
        volumes: :volume
      }[collection.to_sym]
    end
  end
end
