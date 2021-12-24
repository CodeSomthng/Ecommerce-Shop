FactoryBot.define do
  factory :product do
    association :category, factory: :category
    # association :user, factory: :user
    title { Faker::Commerce.brand }
    description { Faker::Commerce.department }
    price { Faker::Commerce.price }
  end
end
