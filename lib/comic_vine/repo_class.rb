module ComicVine
  class RepoClass
    REPOS = {
      character: ::ComicVineCharacterRepo,
      concept: ::ComicVineConceptRepo,
      episode: ::ComicVineEpisodeRepo,
      issue: ::ComicVineIssueRepo,
      location: ::ComicVineLocationRepo,
      movie: ::ComicVineMovieRepo,
      object: ::ComicVineObjectRepo,
      origin: ::ComicVineOriginRepo,
      person: ::ComicVinePersonRepo,
      power: ::ComicVinePowerRepo,
      publisher: ::ComicVinePublisherRepo,
      series: ::ComicVineShowRepo,
      story_arc: ::ComicVineStoryArcRepo,
      team: ::ComicVineTeamRepo,
      volume: ::ComicVineVolumeRepo
    }.freeze

    def call(resource:)
      REPOS[resource.to_sym]
    end
  end
end
