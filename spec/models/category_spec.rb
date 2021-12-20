require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has a title' do
    category = described_class.new(
      title: ''
    )

    expect(category).not_to be_valid
    category.title = 'A valid title'

    expect(category).to be_valid
  end
end
