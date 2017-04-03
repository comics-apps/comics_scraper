class ComicVinePeople < ROM::Relation[:mongo]
  dataset :comic_vine_people
  gateway :mongodb
end
