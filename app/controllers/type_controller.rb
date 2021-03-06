class TypeController < ApplicationController
  before_action :set_type

  def index
    @movies = @type.movies.page(params[:page]).per(10)
  end

  private

  def set_type
    @type = Type.find params[:slug]
  end

end
