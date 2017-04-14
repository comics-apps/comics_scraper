require 'import'

module Marvel
  class Api
    class OrderByValue
      def call(resource:)
        {
          characters: 'modified,name',
          comics: 'modified,title,issueNumber',
          creators: 'modified,lastName,firstName',
          events: 'modified,name',
          series: 'modified,title',
          stories: 'modified,id'
        }[resource.to_sym]
      end
    end
  end
end
