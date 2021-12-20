require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:admin) { create(:user, admin: true) }
  let(:moderator) { create(:user, moderator: true) }
  let(:visitor) { create(:user, visitor: true) }
  let(:guest) { nil }

  let(:product) { create(:product) }

  let(:valid_category_params) do
    {
      title: 'qwerty'
    }
  end

  describe 'GET #show' do
    let(:category_product) { Product.new(valid_category_params.merge({ user: admin, category: category })) }

    before do
      category_product.save
    end

    it 'admin role returns a success response pending' do
      login admin

      get :show, params: { id: category_product.id, product_id: category_product.product_id }

      expect(response).to be_successful
    end

    it 'moderator returns a success response pending' do
      login moderator

      get :show, params: { id: category_product.id, product_id: category_product.product_id }

      expect(response).to be_successful
    end

    it 'visitor role returns a success response pending' do
      login visitor

      get :show, params: { id: category_product.id, product_id: category_product.product_id }

      expect(response).to be_successful
    end

    it 'guest role returns a success response pending' do
      get :show, params: { id: category_product.id, product_id: category_product.product_id }

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'admin role redirect to another page response pending' do
      login admin

      category :create, params: { product_id: product.id, category: valid_category_params }

      expect(Category.first.title).to eq(valid_category_params[:title])

      expect(response.code).to eq('302')
    end

    it 'moderator role redirect to another page response pending' do
      login moderator

      category :create, params: { product_id: product.id, category: valid_category_params }

      expect(Category.first.title).to eq(valid_category_params[:title])

      expect(response.code).to eq('302')
    end

    it 'visitor role redirect to another page response pending' do
      login visitor

      category :create, params: { product_id: product.id, category: valid_category_params }

      expect(Category.first.title).to eq(valid_category_params[:title])

      expect(response.code).to eq('302')
    end

    it 'guest role page not found pending' do
      category :create, params: { product_id: product.id, category: valid_category_params }

      expect(response.code).to eq('404')
    end
  end

  describe 'PUT #update' do
    let(:category_product) { Category.new(valid_category_params.merge({ user: admin_user, category: product })) }

    before do
      category_product.save
    end

    it 'admin role redirect to another page response pending' do
      login admin

      expect(Category.first.title).to eq(category_product.title)

      put :update, params: { id: category_product.id, product_id: product.id, category: valid_category_params }

      expect(Category.first.title).to eq(valid_category_params[:title])

      expect(response.code).to eq('302')
    end

    it 'moderator role redirect to another page response pending' do
      login moderator

      expect(Category.first.title).to eq(category_product.title)

      put :update, params: { id: category_product.id, product_id: product.id, category: valid_category_params }

      expect(Category.first.title).to eq(valid_category_params[:title])

      expect(response.code).to eq('302')
    end

    it 'visitor role page not found pending' do
      login visitor

      expect(Category.first.title).to eq(category_product.title)

      put :update, params: { id: category_product.id, product_id: product.id, category: valid_category_params }

      expect(response.code).to eq('404')
    end

    it 'guest role page not found pending' do
      expect(Category.first.title).to eq(category_product.title)

      put :update, params: { id: category_product.id, product_id: product.id, category: valid_category_params }

      expect(response.code).to eq('404')
    end
  end
end
