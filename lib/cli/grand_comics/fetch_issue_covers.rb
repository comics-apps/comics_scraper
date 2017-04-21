require 'import'

module Cli
  module GrandComics
    class FetchIssueCovers
      include Import['grand_comics.fetch_covers_page',
                     'grand_comics.parse_covers',
                     'grand_comics.save_covers',
                     'persistence.rom']

      def call
        repo = JobRepo.new(rom)

        loop do
          job = find_job(repo: repo)
          break unless job

          fetch_and_save(job: job)
          repo.delete_single(id: job.id)
        end
      end

      private

      def find_job(repo:)
        repo.find_random(type: 'grand_comics_element')
      end

      def job_repo
        JobRepo.new(rom)
      end

      def fetch_and_save(job:)
        issue_id = job.settings['id']
        content = fetch_covers_page.call(issue_id: issue_id)
        covers = parse_covers.call(content: content)
        save_covers.call(issue_id: issue_id, covers: covers)
      end
    end
  end
end
