class ComicVinePublisherRepo < ROM::Repository[:comic_vine_publishers]
  commands :create, update: :by_pk

  def first_by_external_id(external_id)
    comic_vine_publishers.where(external_id: external_id).first
  end
end
