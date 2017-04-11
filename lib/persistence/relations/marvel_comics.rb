class MarvelComics < ROM::Relation[:mongo]
  dataset :marvel_comics
  gateway :mongodb
end
