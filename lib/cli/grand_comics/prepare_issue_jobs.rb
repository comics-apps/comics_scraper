require 'import'

module Cli
  module GrandComics
    class PrepareIssueJobs
      include Import['grand_comics.issue_find_each',
                     'shared.element_job_attributes',
                     'persistence.rom']

      def call
        repo = JobRepo.new(rom)
        issue_find_each.call do |issue|
          repo.create(prepare_attrs(id: issue.id))
        end
      end

      private

      def prepare_attrs(id:)
        element_job_attributes.call(
          type: 'grand_comics_element',
          id: id,
          resource: :issue
        )
      end
    end
  end
end
