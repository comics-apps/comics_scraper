class MarvelEvents < ROM::Relation[:mongo]
  dataset :marvel_events
  gateway :mongodb
end
