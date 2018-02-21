require 'rails_helper'

RSpec.describe TwilioMessageService, type: :service do
  subject(:service) { described_class }

  let(:success_response) do
    VCR.use_cassette('twilio/message_create') do
      service.call(msg: 'String', to: '+380672088376')
    end
  end
  let(:failed_response) do
    VCR.use_cassette('twilio/fail') do
      service.call(msg: 'String')
    end
  end

  describe '#call' do
    context 'when valid params' do
      it { expect(success_response).to be_success }
    end

    context 'when invalid params' do
      it { expect(failed_response).to be_failure }
      it 'should not contain result' do
        expect(failed_response.result).to be nil
      end
      it 'should contain an error' do
        expect(failed_response.errors).to include(:message)
      end
    end
  end
end
