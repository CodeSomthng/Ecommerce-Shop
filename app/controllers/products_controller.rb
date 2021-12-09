class ProductsController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  def create
    Product.create(product_params)
  end

  # display all elements of model
  def index
    @product = Product.all
  end

  def show
    # localhost:3000/categories/:id get
  end

  def update
    # PUT
    @product.update!(product_params)
  end

  def destroy
    @product.destroy!
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
