require 'import'

module Cli
  class MigrateDefault
    include Import['persistence.rom']

    def call(version:)
      migrator = ROM::SQL::Migration::Migrator.new(
        rom.gateways[:default].connection, path: 'db/migrate'
      )

      if version.nil?
        migrator.run
        puts '<= db:migrate executed'
      else
        migrator.run(target: version.to_i)
        puts "<= db:migrate version=[#{version}] executed"
      end
    end
  end
end
