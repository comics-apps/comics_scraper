require 'dry/system/container'

class ComicsScraper < Dry::System::Container
  configure do |config|
    config.auto_register = %w[lib]
  end

  load_paths!('lib')
end
