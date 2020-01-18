FactoryBot.define do
  factory :movie_genre do
    association :movie, factory: :movie
    association :genre, factory: :genre
  end
end