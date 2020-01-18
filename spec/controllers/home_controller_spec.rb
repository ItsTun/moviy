# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'should show all movies' do
      movie = FactoryBot.create :movie
      get :index
      byebug
      expect(assigns(:movies).first).to eq(movie)
    end
  end
end
