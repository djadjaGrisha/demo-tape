require 'rails_helper'

RSpec.describe SpotifyTrackService, type: :service do
  subject(:service) { described_class }

  let(:success_response) do
    VCR.use_cassette('spotify/justin_bieber_track') do
      service.call(query: 'Justin Bieber')
    end
  end
  let(:failed_response) do
    VCR.use_cassette('spotify/no_track') do
      service.call(query: '')
    end
  end

  describe '#call' do
    context 'when valid query' do
      it { expect(success_response).to be_success }
      it 'should contain a track' do
        expect(success_response.result).to be_an RSpotify::Track
      end
    end

    context 'when invalid query' do
      it { expect(failed_response).to be_failure }
      it 'should not contain result' do
        expect(failed_response.result).to be nil
      end
      it 'should contain an error' do
        expect(failed_response.errors).to include(:spotify)
      end
    end
  end
end
