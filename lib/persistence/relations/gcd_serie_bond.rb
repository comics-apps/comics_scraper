class GcdSerieBond < ROM::Relation[:sql]
  dataset :gcd_series_bond
  gateway :gcd

  schema(infer: true) do
    attribute :notes, Types::String # LONGTEXT
  end
end
