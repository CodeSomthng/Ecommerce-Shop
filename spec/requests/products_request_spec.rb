require 'rails_helper'

RSpec.describe 'Categories CRUD', type: :request do
  let(:category) { create(:category) }
  let(:product) { create(:product, category: category) }
  let(:user) { create(:user) }
  let(:valid_params) do
    { title: 'Some_Computer1', description: 'Some default_desc', price: 300, user_id: user.id,
      category_id: category.id }
  end
  # let(:invalid_params) { { title:  :title } }

  describe 'GET /api/categories/:category_id/products' do
    it 'renders a successful response' do
      get api_category_products_path(category.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /api/categories/:category_id/products/:id' do
    it 'renders a succesful response' do
      get api_category_product_path(category.id, product.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'PUT /api/categories/:category_id/products/:id' do
    before do
      put api_category_product_path(category.id, product.id), params: valid_params, as: :json
    end

    it { expect(response).to be_successful }
    it { expect(json.title).to eq('Some_Computer1') }
  end

  describe 'DELETE /api/categories/:category_id/products/:id' do
    before do
      delete api_category_product_path(category.id, product.id), as: :json
    end

    it { expect(response).to be_successful }

    expect do
      delete api_category_product_path(category.id, product.id), as: :json
    end.to change(Product, :count).by(-1)

    context 'when we send incorrect id' do
      it { expect { delete api_category_product_path(-100_500, -2000) }.to raise_error ActiveRecord::RecordNotFound }
    end
  end

  # POST ENDPOINT
  # describe "POST /api/categories/:category_id/products" do
  #   before do
  #     RSpec::Mocks.configuration.allow_message_expectations_on_nil = true
  #     # user = create(:user) #FactoryBot
  #     allow(Api::ProductsController).to receive(:current_user).and_return(user)
  #   end
  #
  #   let!(:category_product) { create(:product, category: category, user: user) }
  #   it "create new product" do
  #     byebug
  #     post api_category_products_path(category.id, user: user), params: category_product ,as: :json
  #     expect(response).to be_successful
  #   end
  #   after do
  #     RSpec::Mocks.configuration.allow_message_expectations_on_nil = false
  #   end
end
