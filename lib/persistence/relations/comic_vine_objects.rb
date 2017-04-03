class ComicVineObjects < ROM::Relation[:mongo]
  dataset :comic_vine_objects
  gateway :mongodb
end
