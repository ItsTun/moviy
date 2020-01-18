class CountryController < ApplicationController
  before_action :set_country

  def index
    @movies = @country.movies.page(params[:page]).per(10)
  end

  private

  def set_country
    @country = Country.find_by_name(params[:name])
  end

end
