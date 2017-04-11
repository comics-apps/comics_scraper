class MarvelSerieRepo < ROM::Repository[:marvel_series]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    marvel_series.where(external_id: external_id).first
  end
end
