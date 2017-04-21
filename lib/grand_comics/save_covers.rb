require 'nokogiri'

require 'import'

module GrandComics
  class SaveCovers
    include Import['persistence.rom']

    def call(issue_id:, covers:)
      repo = GcdCoverRepo.new(rom)
      repo.delete_by_issue_id(issue_id: issue_id)

      i = 1
      covers.each do |cover|
        id = File.basename(cover).split('.')[0].to_i
        if id > 0
          repo.create(id: id, issue_id: issue_id, url: cover, position: i)
        end
        i += 1
      end
    end
  end
end
