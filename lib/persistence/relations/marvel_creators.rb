class MarvelCreators < ROM::Relation[:mongo]
  dataset :marvel_creators
  gateway :mongodb
end
