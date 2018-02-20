class SpotifyTrackService < BaseService
  attr_reader :query, :country

  def initialize(**args)
    @query = args[:query]
    @country = args[:country] || :US
  end

  def execute
    artist = RSpotify::Artist.search(query).first
    artist.top_tracks(country).first
  rescue StandardError
    nil
  end
end
