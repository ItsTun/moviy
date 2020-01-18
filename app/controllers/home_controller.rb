# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page]).per(10)
  end
end
