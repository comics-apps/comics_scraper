require 'import'

module ComicVine
  class PrepareCollectionJobs
    include Import['comic_vine.collections', 'comic_vine.fetch_total_count',
                   'persistence.rom']

    def call(api_key:)
      job_repo = JobRepo.new(rom)
      job_repo.clean_comic_vine_collection_jobs

      collections.call.each do |collection|
        create_collection_jobs(api_key, collection, job_repo)
      end
    end

    private

    def create_collection_jobs(api_key, collection, job_repo)
      total_count = fetch_total_count
                    .call(api_key: api_key, resource: collection)

      pages(total_count).each do |i|
        job_repo.create(job_attributes(collection, i))
      end

      sleep(1)
    end

    def pages(count)
      0.upto(count / 100)
    end

    def job_attributes(collection, page)
      {
        type: 'comic_vine_collection',
        priority: 0,
        settings: {
          collection: collection,
          offset: page * 100
        }
      }
    end
  end
end
