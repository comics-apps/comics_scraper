RSpec.describe ComicVine::PrepareCollectionJobs do
  describe '#call' do
    context 'with origins collection' do
      before do
        allow_any_instance_of(ComicVine::Collections)
          .to receive(:call).and_return(%i(origins))
      end

      let(:job_repo) { JobRepo.new(ComicsScraper['persistence.rom']) }
      let(:jobs) { job_repo.jobs }
      let(:job) { job_repo.jobs.first }

      it 'creates collection job' do
        VCR.use_cassette('prepare_collection_jobs') do
          ComicsScraper['comic_vine.prepare_collection_jobs'].call(
            api_key: ENV['COMIC_VINE_API_KEY']
          )

          expect(jobs.count).to eq(1)
          expect(job.type).to eq('comic_vine_collection')
          expect(job.priority).to eq(0)
          expect(job.settings).to eq('offset' => 0, 'collection' => 'origins')
        end
      end
    end
  end
end
