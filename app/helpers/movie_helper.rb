module MovieHelper
  def movie_genre(movie)
    # movie.genres.each do |genre|
    #   genres << genre
    # end
    genres = ['drama, action']
    genres.join(',')
  end
end
