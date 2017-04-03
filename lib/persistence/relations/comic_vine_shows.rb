class ComicVineShows < ROM::Relation[:mongo]
  dataset :comic_vine_shows
  gateway :mongodb
end
