class HomeController < ApplicationController
  def index; end

  def search
    service = SpotifyTrackService.call(query: params[:artist_name])
    if service.success?
      @track = service.result
      send_msg
    else
      @err_msg = service.errors.dig(:spotify, 0)
    end
  end

  private

  def send_msg
    message = SpotifyTrackMessageService.call(track: @track)
    @err_msg = if message.success?
                 response = TwilioMessageService.call(msg: message.result, to: params[:phone_number])
                 response.errors.dig(:message, 0)
               else
                 message.errors.dig(:spotify, 0)
               end
  end
end
