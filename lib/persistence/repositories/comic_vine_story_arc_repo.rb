class ComicVineStoryArcRepo < ROM::Repository[:comic_vine_story_arcs]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    comic_vine_story_arcs.where(external_id: external_id).first
  end
end
