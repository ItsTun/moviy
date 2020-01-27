# frozen_string_literal: true

module MovieHelper
  def movie_genre(_movie)
    # movie.genres.each do |genre|
    #   genres << genre
    # end
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

  def get_class(i)
    if i == 0
      'active'
    else
      ''
    end
  end
end
