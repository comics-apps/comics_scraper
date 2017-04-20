class GcdBrandGroup < ROM::Relation[:sql]
  dataset :gcd_brand_group
  gateway :gcd

  schema(infer: true) do
    attribute :notes, Types::String # LONGTEXT
  end
end
