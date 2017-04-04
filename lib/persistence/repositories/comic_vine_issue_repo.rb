class ComicVineIssueRepo < ROM::Repository[:comic_vine_issues]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    comic_vine_issues.where(external_id: external_id).first
  end
end
