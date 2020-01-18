require 'rails_helper'

RSpec.describe Type, type: :model do
  describe 'Factory' do
    it 'should have valid Factory' do
      expect { FactoryBot.create :type }.not_to raise_error
    end
  end

  describe 'associations' do
    before :example do
      @type = FactoryBot.create :type
    end

    it 'should has many movies' do
      2.times do
        FactoryBot.create :movie, type_id: @type.id
      end
      expect(@type.movies.count).to eq(2)
    end
  end

  describe 'validations' do
    let(:type) { FactoryBot.attributes_for(:type) }
    context 'name' do
      it 'should be presence' do
        expect(described_class.new(type.merge(name: nil)))
          .not_to be_valid
      end
    end
  end
end
