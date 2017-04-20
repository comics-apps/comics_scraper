class GcdBrand < ROM::Relation[:sql]
  dataset :gcd_brand
  gateway :gcd

  schema(infer: true) do
    attribute :notes, Types::String # LONGTEXT
  end
end
