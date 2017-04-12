require 'import'

module Marvel
  class PrepareCollectionJobs
    include ::Base::PrepareCollectionJobs

    include Import['marvel.collections',
                   'marvel.fetch_collection.total_count',
                   'persistence.rom']

    def call(date: nil)
      @date = date
      @job_repo = job_repo_with_cleaning

      return perform_collection_without_date unless date
      perform_collection_with_date
    end

    private

    def type
      'marvel_collection'
    end

    def perform_collection_with_date
      each_collection do |collection|
        create_collection_jobs(collection, :modified_since)
      end
    end
  end
end
