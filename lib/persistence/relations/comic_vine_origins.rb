class ComicVineOrigins < ROM::Relation[:mongo]
  dataset :comic_vine_origins
  gateway :mongodb
end
