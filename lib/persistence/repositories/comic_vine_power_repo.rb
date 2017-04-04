class ComicVinePowerRepo < ROM::Repository[:comic_vine_powers]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    comic_vine_powers.where(external_id: external_id).first
  end
end
