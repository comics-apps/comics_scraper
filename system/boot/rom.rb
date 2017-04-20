ComicsScraper.namespace(:persistence) do |container|
  container.finalize(:rom) do
    init do
      require 'sequel'
      require 'rom-mongo'
      require 'rom-repository'
      require 'rom-sql'

      logger_level = ENV['MONGO_LOGGER_LEVEL']
      Mongo::Logger.level = logger_level ? logger_level.to_i : ::Logger::WARN

      Sequel.database_timezone = :utc
      Sequel.application_timezone = :local
    end

    start do
      config = ROM::Configuration.new(
        default: [:sql, ENV['DATABASE_URL']],
        mongodb: [:mongo, ENV['MONGO_URL']],
        gcd: [:sql, ENV['GCD_URL']]
      )
      config.auto_registration(container.root.join('lib/persistence'),
                               namespace: false)
      Dir.glob('lib/persistence/repositories/*.rb').each do |f|
        require f.gsub('lib/', '')
      end

      container.register('rom', ROM.container(config))
    end
  end
end
