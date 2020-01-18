FactoryBot.define do
  sequence :type_name do |n|
    "name#{n}"
  end

  factory :type do
    name { generate(:type_name) }
  end
end