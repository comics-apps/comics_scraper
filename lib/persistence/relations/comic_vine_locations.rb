class ComicVineLocations < ROM::Relation[:mongo]
  dataset :comic_vine_locations
  gateway :mongodb
end
