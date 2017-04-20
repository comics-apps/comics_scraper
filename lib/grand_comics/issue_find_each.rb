require 'import'

module GrandComics
  class IssueFindEach
    include Import['grand_comics.issue_count',
                   'persistence.rom']

    LIMIT = 1_000

    def call
      0.upto(issue_count.call / LIMIT).each do |offset|
        issues = GcdIssueRepo.new(rom).find_each(offset: offset * LIMIT, limit: LIMIT)
        issues.each do |issue|
          yield(issue)
        end
      end
    end
  end
end
