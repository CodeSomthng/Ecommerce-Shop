class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def new
    page_not_found unless current_user
    @product = Product.new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.create(product_params.merge({ user_id: current_user.id }))
    redirect_to category_product_path(@category, @product)
  end

  def index
    @products = Product.all.limit(10)
  end

  def show
    @category = Category.find(params[:category_id])
  end

  def edit
    @category = Category.find(params[:category_id])
  end

  def update
    # PUT
    @category = Category.find(params[:category_id])
    @product.update!(product_params)
    redirect_to category_product_path(@category, @product)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product.destroy!
    redirect_to category_path(@category)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end
end
