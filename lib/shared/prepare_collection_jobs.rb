require 'import'

module Shared
  class PrepareCollectionJobs
    include Import['persistence.rom',
                   'shared.collection_job_attributes',
                   'shared.collection_job_attributes_with_date']

    def call(type:, resource:, date: nil, field: nil)
      job_repo = JobRepo.new(rom)
      total_count = get_total_count(type: type, resource: resource,
                                    date: date, field: field)

      0.upto(total_count / 100).each do |i|
        attributes = job_attributes(type: type, resource: resource, date: date,
                                    field: field, page: i)
        job_repo.create(attributes)
      end
    end

    private

    def get_total_count(type:, resource:, date:, field:)
      arguments = { resource: resource }
      arguments = arguments.merge(field => date) if field
      sleep(1)
      count(type: type).call(**arguments)
    end

    def count(type:)
      ComicsScraper["#{type}.api.total_count"]
    end

    def job_attributes(type:, resource:, date:, field:, page:)
      base_arguments = { type: "#{type}_collection", resource: resource,
                         page: page }
      if field
        arguments = { **base_arguments, date: date, field: field }
        collection_job_attributes_with_date.call(**arguments)
      else
        collection_job_attributes.call(**base_arguments)
      end
    end
  end
end
