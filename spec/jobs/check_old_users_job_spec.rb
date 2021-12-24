require 'rails_helper'

RSpec.describe CheckOldUsersJob, type: :job do
  describe '#perform_later' do
    it 'check old users and delete them' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        described_class.perform_later('check')
      end.to have_enqueued_job
    end
  end
end
