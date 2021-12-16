class CartsController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: %i[update destroy]

  def new; end

  def create
    Cart.create(cart_params)
    redirect_to user_carts_path
  end

  # users/1/carts
  def index
    @cart = Cart.all.limit(10)
  end

  def update
    # PUT
    @cart.update!(cart_params)
  end

  def destroy
    @cart.destroy!
    redirect_to user_carts_url(current_user)
  end

  private

  def set_category
    @cart = Cart.find(params[:id])
  end

  def cart_params
    # {carts: {user_id: <user_id>, product_id: <product_id>)} }
    params.permit(:user_id, :product_id)
  end
end
