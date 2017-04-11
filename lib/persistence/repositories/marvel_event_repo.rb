class MarvelEventRepo < ROM::Repository[:marvel_events]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    marvel_events.where(external_id: external_id).first
  end
end
