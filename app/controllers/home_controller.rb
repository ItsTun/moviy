# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page]).per(10)
    @latest_movies = Movie.last(3)
  end
end
