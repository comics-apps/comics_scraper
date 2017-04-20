class GcdReprint < ROM::Relation[:sql]
  dataset :gcd_reprint
  gateway :gcd

  schema(infer: true) do
    attribute :notes, Types::String # LONGTEXT
  end
end
