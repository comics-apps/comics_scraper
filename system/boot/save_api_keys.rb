ComicsScraper.finalize(:save_api_keys) do |container|
  init do
    container.register('api_keys', [ENV['COMIC_VINE_API_KEY']])
  end
end
