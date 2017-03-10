ComicsScraper.finalize(:dotenv) do |_container|
  init do
    require 'dotenv'
    Dotenv.load!
  end
end
