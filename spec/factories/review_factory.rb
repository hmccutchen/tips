FactoryBot.define do
  factory :review do
    title { "MyString" }
    clientele { 1 }
    management { 1 }
    team { 1 }
    content { "MyText" }
    tip_avg { 1 }
    more_details { "MyText" }
    restaurant
    role { "MyString" }
    rating { 1 }
  end
end
