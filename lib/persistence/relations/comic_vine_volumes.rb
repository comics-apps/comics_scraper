class ComicVineVolumes < ROM::Relation[:mongo]
  dataset :comic_vine_volumes
  gateway :mongodb
end
