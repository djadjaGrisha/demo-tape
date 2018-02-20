module SpotifyHelper
  def artist_by_track(track)
    track.album.artists.first
  end
end
