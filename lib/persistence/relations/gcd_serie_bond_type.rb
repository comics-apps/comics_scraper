class GcdSerieBondType < ROM::Relation[:sql]
  dataset :gcd_series_bond_type
  gateway :gcd

  schema(infer: true) do
    attribute :description, Types::String # LONGTEXT
    attribute :notes, Types::String # LONGTEXT
  end
end
