class ComicVineObjectRepo < ROM::Repository[:comic_vine_objects]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    comic_vine_objects.where(external_id: external_id).first
  end
end
