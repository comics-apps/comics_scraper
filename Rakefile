spec = Gem::Specification.find_by_name 'rom-sql'
load "#{spec.gem_dir}/lib/rom/sql/tasks/migration_tasks.rake"

namespace :db do
  task :setup do
    require 'logger'
    ENV['MONGO_LOGGER_LEVEL'] = ::Logger::WARN.to_s
    require_relative 'system/boot'
  end

  namespace :mongo do
    task recreate_indexes: ['db:setup'] do
      service = 'cli.create_mongo_indexes'
      ComicsScraper[service].call
    end
  end
end

namespace :comic_vine do
  desc 'Fetch and display total count for all resource'
  task total_count: ['db:setup'] do
    service = 'cli.comic_vine.total_count'
    ComicsScraper[service].call
  end

  desc 'Prepare collection jobs'
  task prepare_collections: ['db:setup'] do
    service = 'cli.comic_vine.prepare_collection_jobs'
    ComicsScraper[service].call
  end

  desc 'Prepare collection jobs from specified date'
  task :prepare_collections_from, [:date] => ['db:setup'] do |_task, args|
    service = 'cli.comic_vine.prepare_collection_jobs'
    ComicsScraper[service].call(date: args[:date])
  end

  desc 'Prepare element jobs based on collection jobs'
  task prepare_elements: ['db:setup'] do
    service = 'cli.comic_vine.prepare_element_jobs'
    ComicsScraper[service].call
  end

  desc 'Fetch single resources based on element jobs'
  task fetch_elements: ['db:setup'] do
    service = 'cli.comic_vine.fetch_elements'
    ComicsScraper[service].call
  end
end

namespace :grand_comics do
  desc 'Prepare issue jobs'
  task prepare_issues: ['db:setup'] do
    ComicsScraper['cli.grand_comics.prepare_issue_jobs'].call
  end
end

namespace :marvel do
  desc 'Fetch and display total count for all resource'
  task total_count: ['db:setup'] do
    service = 'cli.marvel.total_count'
    ComicsScraper[service].call
  end

  desc 'Prepare collection jobs'
  task prepare_collections: ['db:setup'] do
    service = 'cli.marvel.prepare_collection_jobs'
    ComicsScraper[service].call
  end

  desc 'Prepare collection jobs from specified date'
  task :prepare_collections_from, [:date] => ['db:setup'] do |_task, args|
    service = 'cli.marvel.prepare_collection_jobs'
    ComicsScraper[service].call(date: args[:date])
  end

  desc 'Fetch collections based on element jobs'
  task fetch_collections: ['db:setup'] do
    service = 'cli.marvel.fetch_collection'
    ComicsScraper[service].call
  end
end
