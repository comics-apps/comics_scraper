ComicsScraper.finalize(:save_api_keys) do |container|
  init do
    api_keys = {
      comic_vine: ENV['COMIC_VINE_API_KEY'],
    }

    container.register('api_keys', api_keys)
  end
end
