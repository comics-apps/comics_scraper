RSpec.describe ComicVine::PrepareCollectionJobs do
  describe '#call' do
    let(:job_repo) { JobRepo.new(ComicsScraper['persistence.rom']) }
    let(:jobs) { job_repo.jobs }
    let(:job) { job_repo.jobs.first }

    context 'without date' do
      before do
        allow_any_instance_of(ComicVine::Collections)
          .to receive(:call).and_return(%i[origins])
      end

      it 'creates collection job' do
        VCR.use_cassette('comicvine_prepare_collection_jobs') do
          ComicsScraper['comic_vine.prepare_collection_jobs'].call

          expect(jobs.count).to eq(1)
          expect(job.type).to eq('comic_vine_collection')
          expect(job.priority).to eq(0)
          expect(job.settings.keys)
            .to match_array(%w[offset collection])
        end
      end
    end

    context 'with date' do
      before do
        allow_any_instance_of(ComicVine::Collections)
          .to receive(:call).and_return(%i[movies])
      end

      it 'creates collection job' do
        VCR.use_cassette('comicvine_prepare_collection_jobs_movies') do
          ComicsScraper['comic_vine.prepare_collection_jobs'].call(
            date: '2017-01-01'
          )

          expect(jobs.count).to be > 1
          expect(job.type).to eq('comic_vine_collection')
          expect(job.priority).to eq(0)
          expect(job.settings).to be_a(Sequel::Postgres::JSONBHash)
          settings_attributes = jobs.to_a.map { |job| job.settings.keys }
                                    .flatten.uniq
          expect(settings_attributes)
            .to match_array(%w[offset collection added updated])
        end
      end
    end
  end
end
