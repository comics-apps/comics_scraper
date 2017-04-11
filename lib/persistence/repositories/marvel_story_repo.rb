class MarvelStoryRepo < ROM::Repository[:marvel_stories]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    marvel_stories.where(external_id: external_id).first
  end
end
