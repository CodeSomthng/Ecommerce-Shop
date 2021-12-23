require 'rails_helper'

RSpec.describe 'Categories CRUD', type: :request do
  let(:category) { create(:category) }
  let(:product) { create(:product, category: category) }
  let(:user) { create(:user) }
  let(:valid_params) { { user_id: user.id, product_id: product.id } }

  # let(:invalid_params) { { title:  :title } }

  describe 'GET /api/users/:user_id/carts' do
    it 'renders a successful response' do
      get api_user_carts_path(user.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /api/users/:user_id/carts' do
    it 'renders a successful response' do
      post api_user_carts_path(user.id), params: valid_params, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /api/users/:user_id/carts/:id' do
    it 'renders a successful response' do
      get api_user_carts_path(user.id, product.id), as: :json
      expect(response).to be_successful
    end
  end
end
