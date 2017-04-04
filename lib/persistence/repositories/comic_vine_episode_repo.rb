class ComicVineEpisodeRepo < ROM::Repository[:comic_vine_episodes]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    comic_vine_episodes.where(external_id: external_id).first
  end
end
