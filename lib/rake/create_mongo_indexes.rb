require 'import'

module Rake
  class CreateMongoIndexes
    include Import['persistence.rom']

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
      vendor_indexes(:comic_vine) + vendor_indexes(:marvel)
    end

    def vendor_indexes(vendor)
      ComicsScraper["#{vendor}.collections"].call.map do |collection_name|
        {
          collection: "#{vendor}_#{collection_name}".to_sym,
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
