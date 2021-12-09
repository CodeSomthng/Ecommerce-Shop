class ProductsController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  def new
    page_not_found unless current_user

    @category = Category.find(params[:id])
  end

  def create
    @category = Category.find(params[:id])
    @product = @category.products.create(post_params.merge({ user_id: current_user.id }))
    redirect_to categories_products_path(@category, @product)

    # Product.create(product_params)
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
