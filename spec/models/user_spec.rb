require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Factory' do
    it 'should have valid Factory' do
      expect { FactoryBot.create :user }.not_to raise_error
    end
  end

  describe 'associations' do
    before :example do
      @user = FactoryBot.create :user
    end

    it 'should has many movies' do
      2.times do
        FactoryBot.create :movie, user_id: @user.id
      end
      expect(@user.movies.count).to eq(2)
    end
  end

  describe 'validations' do
    let(:user) { FactoryBot.attributes_for(:user) }
    context 'email' do
      it 'should be presence' do
        expect(described_class.new(user.merge(email: nil)))
          .not_to be_valid
      end
    end
  end
end
