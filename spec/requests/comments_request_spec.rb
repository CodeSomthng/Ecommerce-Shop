require 'rails_helper'

RSpec.describe 'Categories CRUD', type: :request do
  let!(:category) { create(:category) }
  let!(:product) { create(:product, category: category) }
  let!(:comment) { create(:comment, product: product) }
  let!(:user) { create(:user) }

  let(:valid_params) { { title: 'comp_comment_1', user_id: user.id, product_id: product.id } }

  describe 'GET /api/categories/:category_id/products/:product_id/comments' do
    it 'renders a successful response' do
      get api_category_product_comments_path(category.id, product.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'PUT /api/categories/:category_id/products/:product_id/comments/:id' do
    before do
      put api_category_product_comment_path(category.id, product.id, comment.id), params: valid_params, as: :json
    end

    it { expect(response).to be_successful }
    it { expect(json.title).to eq('comp_comment_1') }
  end

  describe 'DELETE /api/categories/:category_id/products/:product_id/comments/:id' do
    it 'renders a successful response' do
      delete api_category_product_comment_path(category.id, product.id, comment.id), as: :json
      expect(response).to be_successful
    end

    it 'check for deleting comment' do
      expect do
        delete api_category_product_comment_path(category.id, product.id, comment.id), as: :json
      end.to change(Comment, :count).by(-1)
    end

    context 'when we send incorrect id' do
      it {
        expect do
          delete api_category_product_comment_path(-100_500, -2000, -3000)
        end.to raise_error ActiveRecord::RecordNotFound
      }
    end
  end
end
