class Api::CategoriesController < Api::ApplicationController
  # load_and_authorize_resource
  before_action :set_category, only: %i[show update destroy]

  def new
    page_not_found unless current_user
    @category = Category.new
  end

  def create
    Category.create(category_params)
  end

  def index
    @categories = Category.all.limit(10).order(:title)
  end

  # def edit; end

  def show; end

  def update
    @category.update!(category_params)

    # redirect_to categories_path
  end

  def destroy
    @category.destroy!

    # redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
