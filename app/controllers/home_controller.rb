class HomeController < ApplicationController
  # skip_before_action :au
  include SendMsg
  include FindTrack

  def index; end

  # def send_msg
  #   binding.pry
  #   @track = SpotifyTrackService.perform(query: params[:artist_name])
  #   response = TwilioMessageService.perform(msg_body: msg_body, recipient_number: params['phone_number'])
  #
  #   @err_msg = response&.error_code == 0 ? '' : response&.message
  #
  #   # artist = RSpotify::Artist.search('Justin Bieber').first
  #   # track = artist.top_tracks(:US).first
  #   #
  #   # body = "#{artist.name}'s top track: #{track.name}"
  #
  #   # @client = Twilio::REST::Client.new 'AC64d8478d2a10c578da81a308acaea13c', '06ec3258a72067e7bca5c55ccc3cdf87'
  #   #
  #   # @client.api.account.messages.create(
  #   #   from: '+12676898582',
  #   #   to: ENV['TEST_PHONE_NUMBER'],
  #   #   body: body
  #   # )
  #   #
  #   # puts "Texted #{ENV['TEST_PHONE_NUMBER']}"
  # end
end
