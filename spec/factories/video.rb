FactoryBot.define do
  factory :video do
    name { 'user' }
    association :movie, factory: :movie
    url { 'url' }
    episode { 1 }
  end
end