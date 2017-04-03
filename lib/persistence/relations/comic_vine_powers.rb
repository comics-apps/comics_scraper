class ComicVinePowers < ROM::Relation[:mongo]
  dataset :comic_vine_powers
  gateway :mongodb
end
