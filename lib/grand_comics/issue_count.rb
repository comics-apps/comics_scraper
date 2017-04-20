require 'import'

module GrandComics
  class IssueCount
    include Import['persistence.rom']

    def call
      GcdIssueRepo.new(rom).count
    end
  end
end
