class SpotifyTrackService
  prepend SimpleCommand
  attr_reader :query, :country

  def initialize(**args)
    @query = args[:query]
    @country = args[:country] || :US
  end

  def call
    artist = RSpotify::Artist.search(query).first
    artist.top_tracks(country).first
  rescue StandardError => e
    Rails.logger.error e.message
    errors.add(:spotify, 'Something went wrong. Please try again')
    nil
  end
end
