class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def create
    Category.create(category_params)
  end

  def index
    @categories = Category.all.limit(10)
  end

  def edit; end

  def show; end

  def update
    @category.update!(category_params)
  end

  def destroy
    @category.destroy!
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
