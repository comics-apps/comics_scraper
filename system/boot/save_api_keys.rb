ComicsScraper.finalize(:save_api_keys) do |container|
  init do
    api_keys = {
      comic_vine: ENV['COMIC_VINE_API_KEY'],
      marvel: {
        public_key: ENV['MARVEL_PUBLIC_KEY'],
        private_key: ENV['MARVEL_PRIVATE_KEY']
      }
    }

    container.register('api_keys', api_keys)
  end
end
