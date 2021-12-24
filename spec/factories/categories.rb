FactoryBot.define do
  factory :category do
    title { Faker::Commerce.brand }
  end
end
