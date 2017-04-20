class GcdReprintFromIssue < ROM::Relation[:sql]
  dataset :gcd_reprint_from_issue
  gateway :gcd

  schema(infer: true) do
    attribute :notes, Types::String # LONGTEXT
  end
end
