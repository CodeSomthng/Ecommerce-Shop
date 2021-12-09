require 'rails_helper'

RSpec.describe Cart, type: :model do
  it 'has a user_id' do
    cart = described_class.new(
      user_id: ''
    )

    expect(cart).not_to be_valid
    category.user_id = 'A valid user_id'

    expect(cart).to be_valid
  end

  it 'has a product_id' do
    cart = described_class.new(
      product_id: ''
    )

    expect(cart).not_to be_valid
    category.product_id = 'A valid product_id'

    expect(cart).to be_valid
  end
end
