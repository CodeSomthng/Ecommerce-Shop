FactoryBot.define do
  factory :carts do
    association :user, factory: :user
  end
end
