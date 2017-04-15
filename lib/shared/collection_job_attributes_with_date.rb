require 'import'

module Shared
  class CollectionJobAttributesWithDate
    include Import['shared.collection_job_attributes']

    def call(type:, resource:, page:, date:, field:)
      attributes = collection_job_attributes
                   .call(type: type, resource: resource, page: page)
      attributes[:settings][field] = date
      attributes
    end
  end
end
