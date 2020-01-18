class GenreController < ApplicationController
  before_action :set_genre

  def index
    @movies = @genre.movies.page(params[:page]).per(10)
  end

  private

  def set_genre
    @genre = Genre.find_by_name(params[:name])
  end

end
