module Shared
  class CollectionJobAttributes
    def call(type:, resource:, page:)
      {
        type: type,
        priority: 0,
        settings: {
          collection: resource,
          offset: page * 100
        }
      }
    end
  end
end
