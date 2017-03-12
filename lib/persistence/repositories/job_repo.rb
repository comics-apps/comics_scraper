class JobRepo < ROM::Repository[:jobs]
  commands :create, :delete

  def clean_comic_vine_collection_jobs
    jobs.where(type: 'comic_vine_collection').delete
  end
end
