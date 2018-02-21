require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  subject(:controller) { described_class }
  let(:artist_name) { 'Justin Bieber' }
  let(:phone_number) { 'number' }
  let(:valid_service_response) do
    VCR.use_cassette('spotify/justin_bieber_track') do
      SpotifyTrackService.call(query: 'Justin Bieber')
    end
  end
  let(:service_response_with_exception) do
    VCR.use_cassette('spotify/no_track') do
      SpotifyTrackService.call(query: '')
    end
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #search' do
    context 'with valid params' do
      before do
        allow(SpotifyTrackService).to receive(:call)
          .with(query: artist_name).and_return(valid_service_response)
        allow(TwilioMessageService).to receive(:call)
          .with(hash_including(to: phone_number)).and_return(valid_service_response)
        post :search, format: :js, params: { phone_number: phone_number, artist_name: artist_name }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'has no assigned errors' do
        expect(assigns(:err_msg)).to eq nil
      end
      it 'has assigned track' do
        expect(assigns(:track)).to eq valid_service_response.result
      end
      it 'should call [send_msg]' do
        expect_any_instance_of(controller).to receive(:send_msg)
        post :search, format: :js, params: { phone_number: phone_number, artist_name: artist_name }
      end
    end

    context 'with invalid params' do
      before do
        allow(SpotifyTrackService).to receive(:call).and_return(service_response_with_exception)
        allow(TwilioMessageService).to receive(:call).and_return(service_response_with_exception)
        post :search, format: :js
      end
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'has assigned errors' do
        expect(assigns(:err_msg)).not_to be_empty
      end
      it 'should not call [send_msg]' do
        expect_any_instance_of(controller).not_to receive(:send_msg)
        post :search, format: :js
      end
    end
  end
end
