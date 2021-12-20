RSpec.describe CartsController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response pending' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @cart pending' do
      cart = Cart.create(user_id: 1, product_id: 1)
      get :index
      expect(assigns(:cart)).to eq([cart])
    end

    it 'renders the index template pending' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
