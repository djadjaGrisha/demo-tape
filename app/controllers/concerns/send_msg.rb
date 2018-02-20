module SendMsg
  extend ActiveSupport::Concern

  def send_msg
    # response = TwilioMessageService.perform(msg_body: message_presenter(@track), recipient_number: params[:phone_number])
    # @err_msg = response&.message unless response.try(:error_code)&.zero?
  end

  private

  def message_presenter(track)
    "#{track.album.artists.first.name}'s top track: #{track.name}"
  end
end
