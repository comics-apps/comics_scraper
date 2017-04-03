class ComicVineTeams < ROM::Relation[:mongo]
  dataset :comic_vine_teams
  gateway :mongodb
end
