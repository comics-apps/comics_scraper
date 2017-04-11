class MarvelCreatorRepo < ROM::Repository[:marvel_creators]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    marvel_creators.where(external_id: external_id).first
  end
end
