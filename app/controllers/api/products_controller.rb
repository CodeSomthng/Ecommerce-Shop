class Api::ProductsController < Api::ApplicationController
  # load_and_authorize_resource
  # comment
  before_action :set_product, only: %i[show update destroy]

  # def new
  #   page_not_found unless current_user
  #   @product = Product.new
  # end

  def create
    @product = @category.products.create(product_params.merge({ user_id: current_user.id }))

    # redirect_to category_product_path(@category, @product)
  end

  def index
    if params[:query].present?
      Product.search(params[:query])
    else
      @products = Product.all.limit(10)
    end
  end

  def show; end

  # def edit; end

  def update
    @product.update!(product_params)

    # redirect_to category_product_path(@category, @product)
  end

  def destroy
    @product.destroy!

    # redirect_to category_path(@category)
  end

  # def search
  #   @search_results = Product.search(params[:query])
  # end

  private

  def set_product
    # @product = Product.find(params[:id])
    @product = @category.products.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end
end
