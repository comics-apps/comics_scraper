class GcdSeriePublicationType < ROM::Relation[:sql]
  dataset :gcd_series_publication_type
  gateway :gcd

  schema(infer: true) do
    attribute :notes, Types::String # LONGTEXT
  end
end
