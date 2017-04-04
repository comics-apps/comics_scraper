class ComicVineOriginRepo < ROM::Repository[:comic_vine_origins]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    comic_vine_origins.where(external_id: external_id).first
  end
end
