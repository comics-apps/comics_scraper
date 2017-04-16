module Shared
  class ElementJobAttributes
    def call(type:, id:, resource:)
      {
        type: type,
        priority: 1,
        settings: {
          id: id,
          resource: resource
        }
      }
    end
  end
end
