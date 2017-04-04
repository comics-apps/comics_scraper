class ComicVinePersonRepo < ROM::Repository[:comic_vine_people]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    comic_vine_people.where(external_id: external_id).first
  end
end
