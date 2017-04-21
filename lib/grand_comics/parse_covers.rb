require 'nokogiri'

module GrandComics
  class ParseCovers
    def call(content:)
      Nokogiri::HTML(content)
              .css('#cover_zoom img')
              .map { |img| img['src'] }
    end
  end
end
