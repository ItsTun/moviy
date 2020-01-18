# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'Factory' do
    it 'should have valid Factory' do
      expect { FactoryBot.create :country }.not_to raise_error
    end
  end

  describe 'associations' do
    before :example do
      @country = FactoryBot.create :country
    end

    it 'should has many movies' do
      2.times do
        FactoryBot.create :movie, country_id: @country.id
      end
      expect(@country.movies.count).to eq(2)
    end
  end

  describe 'validations' do
    let(:country_attr) { FactoryBot.attributes_for(:country) }
    context 'name' do
      it 'should be presence' do
        expect(described_class.new(country_attr.merge(name: nil)))
          .not_to be_valid
      end
    end
  end
end
