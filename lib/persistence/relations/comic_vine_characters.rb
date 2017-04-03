class ComicVineCharacters < ROM::Relation[:mongo]
  dataset :comic_vine_characters
  gateway :mongodb
end
