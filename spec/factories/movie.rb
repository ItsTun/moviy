FactoryBot.define do
  factory :movie do
    name { 'user' }
    association :country, factory: :country
    association :type, factory: :type
    association :user, factory: :user
    release_date { Date.today }
    imdb { 1 }
    rating { 5 }
    description { 'This is description' }
  end
end