require 'import'

module ComicVine
  class PrepareCollectionJobs
    include Import['comic_vine.collections',
                   'comic_vine.fetch_collection.total_count',
                   'persistence.rom']

    def call(date: nil)
      @date = date
      @job_repo = job_repo_with_cleaning

      return perform_collection_with_date if date
      perform_collection_without_date
    end

    private

    def job_repo_with_cleaning
      job_repo = JobRepo.new(rom)
      job_repo.clean_comic_vine_collection_jobs
      job_repo
    end

    def perform_collection_with_date
      each_collection do |collection|
        create_collection_jobs(collection, :date_added)
        create_collection_jobs(collection, :date_last_updated)
      end
    end

    def perform_collection_without_date
      each_collection do |collection|
        create_collection_jobs(collection)
      end
    end

    def create_collection_jobs(collection, date_field = nil)
      total_count = get_total_count(collection, date_field)

      0.upto(total_count / 100).each do |i|
        @job_repo.create(job_attributes(collection, i, date_field))
      end

      sleep(1)
    end

    def get_total_count(collection, date_field = nil)
      arguments = { resource: collection }
      arguments = arguments.merge(date_field => @date) if date_field
      total_count.call(**arguments)
    end

    def job_attributes(collection, page, date_field = nil)
      attributes = main_job_attributes(collection, page)
      return attributes unless date_field

      attributes[:settings][date_field] = @date
      attributes
    end

    def main_job_attributes(collection, page)
      {
        type: 'comic_vine_collection',
        priority: 0,
        settings: {
          collection: collection,
          offset: page * 100
        }
      }
    end

    def each_collection
      collections.call.each do |collection|
        yield(collection)
      end
    end
  end
end