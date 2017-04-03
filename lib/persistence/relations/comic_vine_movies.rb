class ComicVineMovies < ROM::Relation[:mongo]
  dataset :comic_vine_movies
  gateway :mongodb
end
