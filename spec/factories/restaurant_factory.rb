FactoryBot.define do
  factory :restaurant do
    name { Faker::Restaurant.name  }
    sequence(:address) { |n| "#{n} Main St" }
    phone_number { "123-456-7890" }
    res_type { "Fast Food" }
    price_range { "$" }
    hours { "10am-10pm" }
  end
end
