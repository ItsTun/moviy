class MovieController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @movies = Movie.all.page(params[:page]).per(10)
    @latest_movies = Movie.last(3)
  end
  
  def show
    if params[:episode].present?
      @video = @movie.videos.includes(:urls).find_by_episode(params[:episode])
    else
      @video = @movie.videos.includes(:urls)[0]
    end
  end

  private
  def set_movie
    @movie = Movie.includes(:videos).order('videos.episode').find params[:slug]
  end
end
