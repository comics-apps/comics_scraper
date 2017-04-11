class MarvelCharacterRepo < ROM::Repository[:marvel_characters]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    marvel_characters.where(external_id: external_id).first
  end
end
