class GcdBrandUse < ROM::Relation[:sql]
  dataset :gcd_brand_use
  gateway :gcd

  schema(infer: true) do
    attribute :notes, Types::String # LONGTEXT
  end
end
