FactoryBot.define do
  sequence :country_name do |n|
    "name#{n}"
  end

  factory :country do
    name { generate(:country_name) }
  end
end