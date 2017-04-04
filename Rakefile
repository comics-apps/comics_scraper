spec = Gem::Specification.find_by_name 'rom-sql'
load "#{spec.gem_dir}/lib/rom/sql/tasks/migration_tasks.rake"

namespace :db do
  task :setup do
    require_relative 'system/boot'
  end
end

namespace :comic_vine do
  desc 'Prepare collection jobs'
  task prepare_collections: ['db:setup'] do
    ComicsScraper['comic_vine.prepare_collection_jobs'].call
  end

  desc 'Prepare collection jobs from specified date'
  task :prepare_collections_from, [:date] => ['db:setup'] do |_task, args|
    ComicsScraper['comic_vine.prepare_collection_jobs'].call(date: args[:date])
  end

  desc 'Prepare single resource jobs based on collection jobs'
  task prepare_elements: ['db:setup'] do
    rom = ComicsScraper['persistence.rom']
    job_repo = JobRepo.new(rom)
    loop do
      job = job_repo.find_random(type: 'comic_vine_collection')
      break unless job
      p job

      ComicsScraper['comic_vine.prepare_element_jobs'].call(job: job)
    end
  end
end
