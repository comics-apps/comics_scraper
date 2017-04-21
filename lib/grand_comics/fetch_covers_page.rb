require 'open-uri'

require 'import'

module GrandComics
  class FetchCoversPage
    include Import['grand_comics.issue_covers_url']

    def call(issue_id:)
      url = issue_covers_url.call(issue_id: issue_id)
      open(url).read
    rescue => e
      puts "#{Time.now}: #{e}"
      wait = Random.rand(10) + 1
      sleep(wait)
      call(issue_id: issue_id)
    end
  end
end
