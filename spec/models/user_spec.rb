require 'rails_helper'

RSpec.describe User, type: :model do
  it 'email looks like email' do
    current_user = described_class.new(
      name: 'foo',
      email: 'foo',
      password: '111111',
      password_confirmation: '111111'
    )

    expect(current_user).not_to be_valid

    current_user.email = 'qwerty@qwerty.com'
    expect(current_user).to be_valid
  end

  it 'name less than 50 characters' do
    current_user = described_class.new(
      name: 'B8k60iChSIs0oM2SaAPPil7aIaaiXKcusX_9EoVcZYOpIFaK5RVF', # 52 characters
      email: 'foo@bar.com',
      password: '111111',
      password_confirmation: '111111'
    )

    expect(current_user).not_to be_valid

    current_user.name = 'foo'
    expect(current_user).to be_valid
  end
end
