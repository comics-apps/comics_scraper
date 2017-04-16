module ComicVine
  class SingleResource
    RESOURCES = {
      characters: :character,
      concepts: :concept,
      episodes: :episode,
      issues: :issue,
      locations: :location,
      movies: :movie,
      objects: :object,
      origins: :origin,
      people: :person,
      powers: :power,
      publishers: :publisher,
      series_list: :series,
      story_arcs: :story_arc,
      teams: :team,
      volumes: :volume
    }.freeze

    def call(resource:)
      RESOURCES[resource.to_sym]
    end
  end
end
