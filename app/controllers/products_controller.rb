class ProductsController < ApplicationController
  load_and_authorize_resource

  before_action :set_product, only: %i[show edit update destroy]
  before_action :set_category, only: %i[new create show edit update destroy]
  def new
    page_not_found unless current_user
    @product = Product.new
  end

  def create
    @product = @category.products.create(product_params.merge({ user_id: current_user.id }))
    redirect_to category_product_path(@category, @product)
  end

  def index
    @products = Product.all.limit(10)
  end

  def show; end

  def edit; end

  def update
    # PUT
    @product.update!(product_params)
    redirect_to category_product_path(@category, @product)
  end

  def destroy
    @product.destroy!
    redirect_to category_path(@category)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end
end
