class MarvelSeries < ROM::Relation[:mongo]
  dataset :marvel_series
  gateway :mongodb
end
