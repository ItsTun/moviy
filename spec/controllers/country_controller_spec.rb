require 'rails_helper'

RSpec.describe CountryController, type: :controller do
  let(:country) { FactoryBot.create :country }
  describe 'GET #index' do
    it 'should show all movies of country' do
      2.times do
        FactoryBot.create :movie, country_id: country.id
      end
      get :index, params: {name: country.name}
      expect(assigns(:movies).count).to eq(2)
    end
  end
end
