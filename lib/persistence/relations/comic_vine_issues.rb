class ComicVineIssues < ROM::Relation[:mongo]
  dataset :comic_vine_issues
  gateway :mongodb
end
