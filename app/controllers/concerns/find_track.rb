module FindTrack
  extend ActiveSupport::Concern

  def search
    @track = SpotifyTrackService.perform(query: params[:artist_name])
    send_msg if @track
  end
end
