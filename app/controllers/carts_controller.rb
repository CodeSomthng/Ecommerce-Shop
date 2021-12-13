class CartsController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: %i[update destroy]

  def create
    Cart.create(cart_params)
  end

  # users/1/carts
  def index
    @cart = Cart.all
  end

  def update
    # PUT
    @cart.update!(cart_params)
  end

  def destroy
    @cart.destroy!
  end

  private

  def set_category
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:title)
  end
end
