class GcdIndiciaPublisher < ROM::Relation[:sql]
  dataset :gcd_indicia_publisher
  gateway :gcd

  schema(infer: true) do
    attribute :notes, Types::String # LONGTEXT
  end
end
