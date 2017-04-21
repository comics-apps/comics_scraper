module GrandComics
  class IssueCoversUrl
    def call(issue_id:)
      "https://www.comics.org/issue/#{issue_id}/cover/4/"
    end
  end
end
