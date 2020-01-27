# frozen_string_literal: true

class MovieController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @movies = Movie.all.page(params[:page]).per(10)
    @latest_movies = Movie.last(3)
  end

  def search
    @movies = Movie.where('name LIKE ?', "%#{movie_params[:name]}%")
                    .page(params[:page]).per(10)
  end

  def show
    @video = if params[:episode].present?
               @movie.videos.includes(:urls).find_by_episode(params[:episode])
             else
               @movie.videos.includes(:urls)[0]
             end
  end

  private

  def set_movie
    @movie = Movie.includes(:videos).order('videos.episode').find params[:slug]
  end

  def movie_params
    params.require(:movie).permit(:name)
  end
end
