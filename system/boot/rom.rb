ComicsScraper.namespace(:persistence) do |container|
  container.finalize(:rom) do
    init do
      require 'sequel'
      require 'rom-sql'

      Sequel.database_timezone = :utc
      Sequel.application_timezone = :local

      rom_config = ROM::Configuration.new(
        :sql, ENV['DATABASE_URL']
      )

      container.register('config', rom_config)
    end

    start do
      config = container['persistence.config']
      config.auto_registration(container.root.join('lib/persistence'))

      container.register('rom', ROM.container(config))
    end
  end
end
