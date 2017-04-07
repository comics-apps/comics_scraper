require 'import'

module Rake
  class CreateMongoIndexes
    include Import['comic_vine.collections',
                   'persistence.rom']

    def call
      indexes.each do |settings|
        database
          .collection(settings[:collection])
          .indexes
          .create_one(settings[:field], settings[:options])
      end
    end

    private

    def indexes
      collections.call.map do |collection_name|
        {
          collection: "comic_vine_#{collection_name}".to_sym,
          field: { external_id: 1 },
          options: { unique: true }
        }
      end
    end

    def database
      rom.gateways[:mongodb].connection.database
    end
  end
end
