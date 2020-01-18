require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'Factory' do
    it 'should have valid Factory' do
      expect { FactoryBot.create :genre }.not_to raise_error
    end
  end

  describe 'associations' do
    before :example do
      @genre = FactoryBot.create :genre
    end
  end

  describe 'validations' do
    let(:genre_attr) { FactoryBot.attributes_for(:genre) }
    context 'name' do
      it 'should be presence' do
        expect(described_class.new(genre_attr.merge(name: nil)))
          .not_to be_valid
      end
    end
  end
end
