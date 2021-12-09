require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a title' do
    product = described_class.new(
      title: ''
    )

    expect(product).not_to be_valid
    product.title = 'A valid title'

    expect(product).to be_valid
  end

  it 'has a description' do
    product = described_class.new(
      description: ''
    )

    expect(product).not_to be_valid
    product.description = 'A valid description'

    expect(product).to be_valid
  end

  it 'has a price' do
    product = described_class.new(
      price: ''
    )

    expect(product).not_to be_valid
    product.price = 'A valid price'

    expect(product).to be_valid
  end
end
