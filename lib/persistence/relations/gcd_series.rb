class GcdSeries < ROM::Relation[:sql]
  dataset :gcd_series
  gateway :gcd

  schema(infer: true) do
    attribute :notes, Types::String # LONGTEXT
    attribute :publication_notes, Types::String # LONGTEXT
    attribute :tracking_notes, Types::String # LONGTEXT
  end
end
