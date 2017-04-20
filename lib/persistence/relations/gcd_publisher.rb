class GcdPublisher < ROM::Relation[:sql]
  dataset :gcd_publisher
  gateway :gcd

  schema(infer: true) do
    attribute :notes, Types::String # LONGTEXT
  end
end
