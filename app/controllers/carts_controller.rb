class CartsController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  def create
    Cart.create(cart_params)
  end

  # display all elements of model
  def index
    @cart = Cart.all
  end

  def show
    # localhost:3000/categories/:id get
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
