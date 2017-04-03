class ComicVinePublishers < ROM::Relation[:mongo]
  dataset :comic_vine_publishers
  gateway :mongodb
end
