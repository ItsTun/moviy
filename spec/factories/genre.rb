FactoryBot.define do
  sequence :genre_name do |n|
    "name#{n}"
  end

  factory :genre do
    name { generate(:genre_name) }
  end
end