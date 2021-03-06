require 'rspotify'
require 'twilio-ruby'

RSpotify.authenticate('3a6010e0d5eb491996b9b10ec5722bae', '6b4b95f225134775a2beb8de051b55b6')

artist = RSpotify::Artist.search('Justin Bieber').first
track = artist.top_tracks(:US).first

body = "#{artist.name}'s top track: #{track.name}"

@client = Twilio::REST::Client.new 'AC64d8478d2a10c578da81a308acaea13c', '06ec3258a72067e7bca5c55ccc3cdf87'

@client.api.account.messages.create(
  from: '+12676898582',
  to: ENV['TEST_PHONE_NUMBER'],
  body: body
)

# rubocop:disable Rails/Output
puts "Texted #{ENV['TEST_PHONE_NUMBER']}"
# rubocop:enable Rails/Output
