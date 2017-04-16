module Marvel
  class RepoClass
    REPOS = {
      characters: ::MarvelCharacterRepo,
      comics: ::MarvelComicRepo,
      creators: ::MarvelCreatorRepo,
      events: ::MarvelEventRepo,
      series: ::MarvelSerieRepo,
      stories: ::MarvelStoryRepo
    }.freeze

    def call(resource:)
      REPOS[resource.to_sym]
    end
  end
end
