# frozen_string_literal: true

module MovieHelper
  def movie_genre(_movie)
    genres = ['drama, action']
    genres.join(',')
  end

  def movie_title(name, episode)
    if episode.present?
      name + ' ' + episode
    else
      name + ' 1'
    end
  end

  def stream_link(url)
    if url.present?
      url
    else
      ''
    end
  end

  def get_class(i)
    if i.zero?
      'active'
    else
      ''
    end
  end
end
