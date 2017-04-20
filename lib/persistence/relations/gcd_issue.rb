class GcdIssue < ROM::Relation[:sql]
  dataset :gcd_issue
  gateway :gcd

  schema(infer: true) do
    attribute :editing, Types::String # LONGTEXT
    attribute :notes, Types::String # LONGTEXT
  end
end
