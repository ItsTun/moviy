module MovieHelper
  def movie_genre(movie)
    # movie.genres.each do |genre|
    #   genres << genre
    # end
    genres = ['drama, action']
    genres.join(',')
  end

  def get_class(i)
    if i == 0
      return "active"
    else
      return ""
    end
  end
end
