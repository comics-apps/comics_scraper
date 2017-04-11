class MarvelCharacters < ROM::Relation[:mongo]
  dataset :marvel_characters
  gateway :mongodb
end
