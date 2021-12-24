FactoryBot.define do
  factory :comment do
    association :product, factory: :product
    association :user, factory: :user
    title { Faker::Commerce.brand }
  end
end
