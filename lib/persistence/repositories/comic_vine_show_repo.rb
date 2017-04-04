class ComicVineShowRepo < ROM::Repository[:comic_vine_shows]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    comic_vine_shows.where(external_id: external_id).first
  end
end
