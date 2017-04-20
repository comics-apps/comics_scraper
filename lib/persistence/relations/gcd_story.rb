class GcdStory < ROM::Relation[:sql]
  dataset :gcd_story
  gateway :gcd

  schema(infer: true) do
    attribute :characters, Types::String # LONGTEXT
    attribute :colors, Types::String # LONGTEXT
    attribute :editing, Types::String # LONGTEXT
    attribute :inks, Types::String # LONGTEXT
    attribute :letters, Types::String # LONGTEXT
    attribute :notes, Types::String # LONGTEXT
    attribute :pencils, Types::String # LONGTEXT
    attribute :reprint_notes, Types::String # LONGTEXT
    attribute :script, Types::String # LONGTEXT
    attribute :synopsis, Types::String # LONGTEXT
  end
end
