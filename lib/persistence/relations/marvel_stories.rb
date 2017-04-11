class MarvelStories < ROM::Relation[:mongo]
  dataset :marvel_stories
  gateway :mongodb
end
