class Api::CommentsController < Api::ApplicationController
  # load_and_authorize_resource

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params.merge(user_id: current_user.id))

    # redirect_to category_product_path(params[:category_id], @product)
  end

  # def edit
  #   @product = Product.find(params[:product_id])
  #   @comment = @product.comments.find(params[:id])
  # end
  def index
    @product = Product.find(params[:product_id])
    @comments = @product.comments
  end

  def update
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.update!(comment_params)

    # @comment = Comment.find(params[:id])
    # @category = @comment.product.category_id
    # @comment.update(comment_params)
    # redirect_to category_product_path(@category, params[:product_id]) if @comment.update(comment_params)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy!

    # redirect_to category_product_path(params[:category_id], params[:product_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:title)
  end
end
