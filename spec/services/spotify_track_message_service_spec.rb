require 'rails_helper'

RSpec.describe SpotifyTrackMessageService, type: :service do
  subject(:service) { described_class }

  let(:track) do
    VCR.use_cassette('spotify/justin_bieber_track') do
      SpotifyTrackService.call(query: 'Justin Bieber').result
    end
  end
  let(:success_response) { service.call(track: track) }
  let(:failed_response) { service.call(track: '') }

  describe '#call' do
    context 'when valid track' do
      it { expect(success_response).to be_success }
      it 'should contain the track name' do
        expect(success_response.result).to include(track.name)
      end
      it 'should contain the artist name' do
        expect(success_response.result).to include(track.album.artists.first.name)
      end
    end

    context 'when invalid track' do
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
