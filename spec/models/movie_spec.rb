# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie_attr) do
    movie_attr = FactoryBot.attributes_for(:movie)
    @country = FactoryBot.create :country
    @type = FactoryBot.create :type
    @user = FactoryBot.create :user
    movie_attr[:country_id] = @country.id
    movie_attr[:type_id] = @type.id
    movie_attr[:user_id] = @user.id
    movie_attr
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect { FactoryBot.create :movie }.not_to raise_error
    end
  end

  describe 'associations' do
    before :example do
      @country = FactoryBot.create :country
      @type = FactoryBot.create :type
      @user = FactoryBot.create :user
      @movie = FactoryBot.create :movie,
                                  type_id: @type.id,
                                  country_id: @country.id,
                                  user_id: @user.id
    end

    it 'should has many videos' do
      2.times do
        FactoryBot.create :video, movie_id: @movie.id
      end
      expect(@movie.videos.count).to eq(2)
    end

    it 'should belongs to country' do
      expect(@movie.country).to eq(@country)
    end

    it 'should belongs to type' do
      expect(@movie.type).to eq(@type)
    end

    it 'should belongs to user' do
      expect(@movie.user).to eq(@user)
    end
  end

  describe 'validations' do
    context 'name' do
      it 'should be presence' do
        expect(described_class.new(movie_attr.merge(name: nil)))
          .not_to be_valid
      end
    end

    context 'country_id' do
      it 'should not valid if not integer' do
        expect(described_class.new(movie_attr.merge(country_id: "test")))
          .not_to be_valid
      end

      it 'should be valid if integer' do
        expect(described_class.new(movie_attr.merge(country_id: @country.id)))
          .to be_valid
      end
    end

    context 'type_id' do
      it 'should not valid if not integer' do
        expect(described_class.new(movie_attr.merge(type_id: "test")))
          .not_to be_valid
      end

      it 'should be valid if integer' do
        expect(described_class.new(movie_attr.merge(type_id: @type.id)))
          .to be_valid
      end
    end

    context 'user_id' do
      it 'should not valid if not integer' do
        expect(described_class.new(movie_attr.merge(user_id: "test")))
          .not_to be_valid
      end

      it 'should be valid if integer' do
        expect(described_class.new(movie_attr.merge(user_id: @user.id)))
          .to be_valid
      end
    end
  end
end
