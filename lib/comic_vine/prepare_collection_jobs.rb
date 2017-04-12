require 'import'

module ComicVine
  class PrepareCollectionJobs
    include ::Base::PrepareCollectionJobs

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

    def type
      'comic_vine_collection'
    end

    def perform_collection_with_date
      each_collection do |collection|
        create_collection_jobs(collection, :date_added)
        create_collection_jobs(collection, :date_last_updated)
      end
    end
  end
end
