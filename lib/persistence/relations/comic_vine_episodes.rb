class ComicVineEpisodes < ROM::Relation[:mongo]
  dataset :comic_vine_episodes
  gateway :mongodb
end
