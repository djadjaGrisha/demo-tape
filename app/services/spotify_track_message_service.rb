class SpotifyTrackMessageService
  prepend SimpleCommand
  include SpotifyHelper
  attr_reader :track

  def initialize(**args)
    @track = args[:track]
  end

  def call
    "#{artist_by_track(@track).name}'s top track: #{@track.name}"
  rescue StandardError => e
    Rails.logger.error e.message
    errors.add(:spotify, 'Something went wrong. Please try again')
    nil
  end
end
