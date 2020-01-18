require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'Factory' do
    it 'should have valid Factory' do
      expect { FactoryBot.create :video }.not_to raise_error
    end
  end

  describe 'associations' do
    before :example do
      @movie = FactoryBot.create :movie
      @video = FactoryBot.create :video, movie_id: @movie.id
    end

    it 'should belongs to movie' do
      expect(@video.movie).to eq(@movie)
    end
  end

  describe 'validations' do
    let(:movie) { FactoryBot.create :movie }
    let(:video) { FactoryBot.attributes_for(:video) }
    let(:attr) { video.merge(movie_id: movie.id)}
    context 'name' do
      it 'should be presence' do
        expect(described_class.new(video.merge(name: nil)))
          .not_to be_valid
      end
    end

    context 'episode' do
      it 'should be presence' do
        expect(described_class.new(attr.merge(episode: nil)))
          .not_to be_valid
      end

      it 'should not valid if not integer' do
        expect(described_class.new(attr.merge(episode: "test")))
          .not_to be_valid
      end

      it 'should be valid if integer' do
        expect(described_class.new(attr.merge(episode: 1)))
          .to be_valid
      end
    end

    context 'movie_id' do
      it 'should be presence' do
        expect(described_class.new(attr.merge(movie_id: nil)))
          .not_to be_valid
      end

      it 'should not valid if not integer' do
        expect(described_class.new(attr.merge(movie_id: "test")))
          .not_to be_valid
      end

      it 'should be valid if integer' do
        expect(described_class.new(attr))
          .to be_valid
      end
    end
  end
end
