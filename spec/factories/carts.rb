FactoryBot.define do
  factory :carts do
    association :user, factory: :user
    # association :product, factory: :product
  end
end
