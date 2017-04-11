class MarvelComicRepo < ROM::Repository[:marvel_comics]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    marvel_comics.where(external_id: external_id).first
  end
end
