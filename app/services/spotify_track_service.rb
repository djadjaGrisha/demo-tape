class SpotifyTrackService
  prepend SimpleCommand
  attr_reader :query, :country
  AWAITING_TIME = 5

  def initialize(**args)
    @query = args[:query]
    @country = args[:country] || :US
  end

  def call
    # Interrupt the request (with exception) if it takes too long
    Timeout.timeout(AWAITING_TIME) do
      artist = RSpotify::Artist.search(query).first
      artist.top_tracks(country).first
    end
  rescue Timeout::Error => e
    Rails.logger.error e.message
    errors.add(:spotify, 'Spotify is unavailable. Please try later')
    nil
  rescue StandardError => e
    Rails.logger.error e.message
    errors.add(:spotify, 'Something went wrong. Please try again')
    nil
  end
end
