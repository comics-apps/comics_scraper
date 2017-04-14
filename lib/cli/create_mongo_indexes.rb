require 'import'

module Cli
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
      vendor_indexes(vendor: :comic_vine) +
        vendor_indexes(vendor: :marvel)
    end

    def vendor_indexes(vendor:)
      collections(vendor: vendor).map do |api_collection_name|
        {
          collection: :"#{vendor}_#{api_collection_name}".to_sym,
          field: { external_id: 1 },
          options: { unique: true }
        }
      end
    end

    def collections(vendor:)
      ComicsScraper[:"#{vendor}.collections"].call
    end

    def database
      rom.gateways[:mongodb].connection.database
    end
  end
end
