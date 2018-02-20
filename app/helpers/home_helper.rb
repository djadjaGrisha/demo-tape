module HomeHelper
  def artist_media_info(track)
    artist = artist_by_track(track)
    content_tag :div, class: 'media' do
      concat image_tag(artist_img(artist), class: 'align-self-center mr-3')
      concat artist_info(artist)
    end
  rescue StandardError => e
    Rails.logger.error e.message
    nil
  end

  def artist_embed(track)
    ActiveSupport::SafeBuffer.new(artist_by_track(track).embed)
  rescue StandardError => e
    Rails.logger.error e.message
    nil
  end

  def artist_img(artist)
    artist.images.last['url']
  end

  def artist_info(artist)
    content_tag :div, class: 'media-body' do
      concat content_tag(:h5, link_to(artist.name, artist.external_urls['spotify'], target: '_blank'), class: 'mt-0')
      concat content_tag(:p, "Genres: #{artist.genres.join(', ')}")
      concat content_tag(:p, "Popularity: #{artist.popularity}")
    end
  end
end
