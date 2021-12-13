class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def create
    Category.create(category_params)
  end

  # display all elements of model
  def index
    @categories = Category.all
  end

  def edit; end

  def show
    # authorize! :read, @article
    # byebug
    # localhost:3000/categories/:id get
  end

  def update
    # PUT
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
