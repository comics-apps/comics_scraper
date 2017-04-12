class JobRepo < ROM::Repository[:jobs]
  commands :create, :delete

  def clean_jobs(type:)
    jobs.where(type: type).delete
  end

  def find_random(type:)
    jobs.where(type: type).order(Sequel.lit('RANDOM()')).first
  end

  def delete_single(id:)
    jobs.where(id: id).delete
  end
end
