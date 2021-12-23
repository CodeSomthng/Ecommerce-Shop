require 'rails_helper'

RSpec.describe 'Categories CRUD', type: :request do
  let!(:category) { create(:category) }
  let(:invalid_params) { { title: nil } }

  describe 'GET /api/categories' do
    it 'renders a successful response' do
      get api_categories_path, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /api/categories' do
    # let(:valid_attributes) { { title:  "Computesss" } }
    it 'create new category' do
      post api_categories_path(category.id), params: category, as: :json
      expect(response).to be_successful
    end

    it 'does not create blank category' do
      expect do
        post api_categories_path(invalid_params), params: { category: invalid_params }, as: :json
      end.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  describe 'GET /api/categories:id' do
    it 'renders a successful response' do
      get api_category_path(category.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'PUT /api/categories:id' do
    let(:new_valid_params) { { title: 'Computerssss' } }

    before do
      put api_category_path(category.id), params: new_valid_params, as: :json
    end

    it { expect(response).to be_successful }
    it { expect(json.title).to eq('Computerssss') }
  end

  describe 'DELETE /api/categories:id' do
    context 'when delete category by id' do
      before do
        delete api_category_path(category.id), as: :json
      end

      it { expect(response).to be_successful }
    end

    it 'decrease count delete category' do
      expect do
        delete api_category_path(category.id), as: :json
      end.to change(Category, :count).by(-1)
    end

    # expect(response.status).to eq(204)
    # expect(json.title).to eq('Computerssss')
  end

  context 'when we send incorrect id' do
    it { expect { delete api_category_path(-100_500) }.to raise_error ActiveRecord::RecordNotFound }
  end
end
