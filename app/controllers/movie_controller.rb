class MovieController < ApplicationController
  before_action :set_movie
  def show
  end

  private

  def set_movie
    @movie = Movie.find_by_name(params[:name])
  end
end
