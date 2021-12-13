require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:admin) { create(:user, admin: true) }
  let(:moderator) { create(:user, moderator: true) }
  let(:visitor) { create(:user, user_role: true) }
  let(:guest) { nil }

  let(:valid_product_params) do
    {
      title: 'hello',
      description: 'asdfg asfg asdfgh'
    }
  end

  describe 'GET #index' do
    it 'index returns a success response pending' do
      get :index

      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:product) { create(:product) }

    before do
      product.save
    end

    it 'admin role returns a success response pending' do
      login admin

      get :show, params: { id: product.id }

      expect(response).to be_successful
    end

    it 'moderator returns a success response pending' do
      login moderator_user

      get :show, params: { id: product.id }

      expect(response).to be_successful
    end

    it 'user role returns a success response pending' do
      login user

      get :show, params: { id: product.id }

      expect(response).to be_successful
    end

    it 'guest role returns a success response pending' do
      get :show, params: { id: product.id }

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'admin role redirect to another page response pending' do
      login admin_user

      post :create, params: { product: valid_product_params }

      expect(Product.first.title).to eq(valid_product_params[:title])
      expect(Product.first.description).to eq(valid_product_params[:description])

      expect(response.code).to eq('302')
    end

    it 'moderator role page not found pending' do
      login moderator_user

      post :create, params: { product: valid_product_params }

      expect(response.code).to eq('404')
    end

    it 'user role page not found pending' do
      login user

      post :create, params: { product: valid_product_params }

      expect(response.code).to eq('404')
    end

    it 'guest role page not found pending' do
      post :create, params: { product: valid_product_params }

      expect(response.code).to eq('404')
    end
  end

  describe 'PUT #update' do
    let(:product) { create(:product) }

    it 'admin role redirect to another page response pending' do
      login admin_user
      product.save

      expect(Product.first.title).to eq(product.title)
      expect(Product.first.description).to eq(product.description)

      put :update, params: { id: product.id, product: valid_product_params }

      expect(Product.first.title).to eq(valid_product_params[:title])
      expect(Product.first.description).to eq(valid_product_params[:description])

      expect(response.code).to eq('302')
    end

    it 'moderator role page not found pending' do
      login moderator_user
      product.save

      put :update, params: { id: product.id, product: valid_product_params }

      expect(response.code).to eq('404')
    end

    it 'user role page not found pending' do
      login user
      product.save

      put :update, params: { id: product.id, product: valid_product_params }

      expect(response.code).to eq('404')
    end

    it 'guest role page not found pending' do
      product.save

      put :update, params: { id: product.id, product: valid_product_params }

      expect(response.code).to eq('404')
    end
  end

  describe 'PUT #destroy' do
    let(:product) { create(:product) }

    it 'admin role redirect to another page response pending' do
      login admin_user
      product.save

      expect(Product.first.title).to eq(product.title)
      expect(Product.first.description).to eq(product.description)

      delete :destroy, params: { id: product.id }

      expect { Product.find(product.id) }.to raise_error(ActiveRecord::RecordNotFound)
      expect(response.code).to eq('302')
    end

    it 'moderator role page not found pending' do
      login moderator_user
      product.save

      expect(Product.first.title).to eq(product.title)
      expect(Product.first.description).to eq(product.description)

      delete :destroy, params: { id: product.id }

      expect(Product.first.title).to eq(product.title)
      expect(Product.first.description).to eq(product.description)

      expect(response.code).to eq('404')
    end

    it 'user role page not found pending' do
      login user
      product.save

      expect(Product.first.title).to eq(product.title)
      expect(Product.first.description).to eq(product.description)

      delete :destroy, params: { id: product.id }

      expect(Product.first.title).to eq(product.title)
      expect(Product.first.description).to eq(product.description)

      expect(response.code).to eq('404')
    end

    it 'guest role page not found pending' do
      product.save

      expect(Product.first.title).to eq(product.title)
      expect(Product.first.description).to eq(product.description)

      delete :destroy, params: { id: product.id }

      expect(Product.first.title).to eq(product.title)
      expect(Product.first.description).to eq(product.description)

      expect(response.code).to eq('404')
    end
  end
end
